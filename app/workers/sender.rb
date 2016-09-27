class Sender
  include Sidekiq::Worker

  def perform(classname, id)
  	clazz = classname.constantize
  	clazz.connection
  	obj = clazz.find(id)
  	result = Client.send(obj)
  	if result && result.key?('result') && result['result'] == "OK"
  		obj.touch(response_id: result['id']) 
  		Log.create!(service: classname, service_id: id, action: 'send', success: 1, error: nil)
  	elsif result && result.key?('error')
  		raise Exception.new(result['message'])
  	else
  		raise Exception.new('Unknown error')
    end
  rescue Exception => e
  	Log.create!(service: classname, service_id: id, action: 'send', success: 0, error: e.message[0..254])
    raise e
  end

end