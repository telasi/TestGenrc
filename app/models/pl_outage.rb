class PlOutage < ActiveRecord::Base
	self.table_name='pl_outages'

  after_save :put_to_queue

  def put_to_queue
    SendQueue.create(service: 'PlOutage', service_id: self.id )
  end

end
