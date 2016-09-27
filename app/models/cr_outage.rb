class CrOutage < ActiveRecord::Base
	self.table_name='cr_outages'
  CASE_ID = 2
  # after_create :put_to_queue

  #def put_to_queue
   # SendQueue.create(service: 'CrOutage', service_id: self.id )
  #end

  def to_hash
  			fields = [  "disabling_area",
  				        "break_reason",
  				        "break_type",
  				        "abonent_amount",
                        "disabling_consumer_count",
                        "JIT_switch_on_consumer_count",
					    "break_start_date",
					    "break_start_time",
					    "info_url",	
					    "attach_2_1",	
					    "attach_2_2"			    
					  ]

  	self.serializable_hash.map{ |k,v| [fields[fields.index{ |s| s.casecmp(k)==0 }] ,v] if fields.any?{ |s| s.casecmp(k)==0 } }.compact.to_h
  end

  def stage
	1
  end
end
