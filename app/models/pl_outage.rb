class PlOutage < ActiveRecord::Base
	self.table_name='pl_outages'
  CASE_ID = 1
  # after_create :put_to_queue

  #def put_to_queue
   # SendQueue.create(service: 'PlOutage', service_id: self.id )
  #end

  def to_hash
  			fields = [  "break_reason",
					    "break_start_date",
					    "break_end_date",
					    "disabling_consumer_count",
					    "abonent_amount",
					    "JIT_infromation_consumer_count",
					    "info_url",
					    "attach_1_1",
					    "attach_1_2",
					    "attach_1_4",
					    "disabling_area"]

  	self.serializable_hash.map{ |k,v| [fields[fields.index{ |s| s.casecmp(k)==0 }] ,v] if fields.any?{ |s| s.casecmp(k)==0 } }.compact.to_h
  end

  def stage
	1
  end

end



