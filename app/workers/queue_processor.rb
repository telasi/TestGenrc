class QueueProcessor
  include Sidekiq::Worker

  def perform
    SendQueue.not_sent.each do |item|
      send_item(item)
    end
  end

  def send_item(item)
    clazz = item.service.constantize
    clazz.connection
    obj = clazz.find(item.service_id)
    result = Client.send_b(obj)
    if result && result.key?('result') && result['result'] == "OK"
      obj.update_attributes!(response_id: result['id']) 
      item.update_attributes(sent_at: Time.now)
      Log.create!(service: item.service, service_id: item.service_id, action: 'send', success: 1, error: nil)
    elsif result && result.key?('error')
      raise Exception.new(result['message'])
    else
      raise Exception.new('Unknown error')
    end
  rescue Exception => e
    Log.create!(service: item.service, service_id: item.service_id, action: 'send', success: 0, error: e.message[0..254])
    raise e
  end

end

Sidekiq::Cron::Job.create(name: 'Queue Processor - every 1min', cron: '* * * * *', class: 'QueueProcessor')