class QueueProcessor
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    SendQueueV.all.each do |item|
      send_item(item)
    end
  end

  def send_item(item)
    clazz = item.service.constantize
    clazz.connection
    obj = clazz.find(item.service_id)
    result = Client.send_b(obj, item.stage)
    if result && result.key?('result') && result['result'] == "OK"
      obj.update_attributes!(response_id: result['id']) if result['id'].present?
      ##
      item2=SendQueue.find_by(id: item.id)
      item2.update(sent_at: Time.now)
      item2.save
      #item.update_attributes(sent_at: Time.now)
      Log.create!(service: item.service, service_id: item.service_id, action: "send #{item.stage}", success: 1, error: nil)
    elsif result && result.key?('error')
      raise Exception.new(result['message'])
    else
      raise Exception.new('Unknown error')
    end
  rescue Exception => e
    Log.create!(service: item.service, service_id: item.service_id, action: "send #{item.stage}", success: 0, error: e.message[0..3999])
    #raise e
  end

end

Sidekiq::Cron::Job.create(name: 'Queue Processor - every 1min', cron: '* * * * *', class: 'QueueProcessor')