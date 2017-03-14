class QueueProcessor
  #include Sidekiq::Worker
  #sidekiq_options retry: false

  def perform
    SendQueueV.all.each do |item|
      send_item(item)
    end
  end


  def self.perform_cron
    SendQueueV.all.each do |item|
      send_item_cron(item)
    end
  end

  def self.send_item_cron(item)
    clazz = item.service.constantize
    clazz.connection
    obj = clazz.find(item.service_id)
    result = Client.send_b(obj, item.stage)
    if result && result.key?('result') && result['result'] == "OK"
      obj.update_stage_date if obj.respond_to?('update_stage_date')
      obj.update_attributes!(response_id: result['id']) if result['id'].present?
      obj.update_attributes!(gnerc_status: result['status']) if result['status'].present?
      ##
      item2=SendQueue.find_by(id: item.id)
      item2.update(sent_at: Time.now)
      item2.save
      #item.update_attributes(sent_at: Time.now)
      Log.create!(service: item.service, service_id: item.service_id, action: "send #{item.stage}", success: 1, error: nil)
    elsif result && result.key?('error')
      if result.key?('error') && result['error'] == "12"
        item2=SendQueue.find_by(id: item.id)
        item2.update(sent_at: Time.now)
        item2.save
      else
        raise Exception.new(result['message'])
      end
    else
      raise Exception.new('error: ' + result.to_s)
    end
  rescue Exception => e
    Log.create!(service: item.service, service_id: item.service_id, action: "send #{item.stage}", success: 0, error: e.message[0..3999])
    #raise e
  end




  def send_item(item)
    clazz = item.service.constantize
    clazz.connection
    obj = clazz.find(item.service_id)
    result = Client.send_b(obj, item.stage)
    if result && result.key?('result') && result['result'] == "OK"
      obj.update_stage_date if obj.respond_to?('update_stage_date')
      obj.update_attributes!(response_id: result['id']) if result['id'].present?
      obj.update_attributes!(gnerc_status: result['status']) if result['status'].present?
      ##
      item2=SendQueue.find_by(id: item.id)
      item2.update(sent_at: Time.now)
      item2.save
      #item.update_attributes(sent_at: Time.now)
      Log.create!(service: item.service, service_id: item.service_id, action: "send #{item.stage}", success: 1, error: nil)
    elsif result && result.key?('error')
      if result.key?('error') && result['error'] == "12"
        item2=SendQueue.find_by(id: item.id)
        item2.update(sent_at: Time.now)
        item2.save
      else
        raise Exception.new(result['message'])
      end
    else
      raise Exception.new('Unknown error')
    end
  rescue Exception => e
    Log.create!(service: item.service, service_id: item.service_id, action: "send #{item.stage}", success: 0, error: e.message[0..3999])
    #raise e
  end




end

#Sidekiq::Cron::Job.create(name: 'Queue Processor - every 1min', cron: '*/5 * * * *', class: 'QueueProcessor')