# -*- encoding : utf-8 -*-
class Docflow5 < ActiveRecord::Base
  #include Base

  CASE_ID = 5

  #after_save :put_to_queue

  self.table_name = 'docflow5'

  def self.start(params)
  	params.merge!({stage: 1, stage_1_date: Time.now})
  	docflow = Docflow5.create!(params)
    docflow.put_to_queue
  end

  def next_step(params)
    self.stage =+ 1
    params = params.except(:id).merge!({ "stage_#{self.stage}_date".to_sym => Time.now })
    self.update_attributes!(params.except(:id))
    self.put_to_queue
  end

  def send_to_gnerc
 	  Sender.perform_async('Docflow5', self.id)
  end

  def put_to_queue
    SendQueue.create!(service: 'Docflow5', service_id: self.id, stage: self.stage)
  end

  def to_hash
  	case self.stage
  		when 1
  			fields = [:abonent_number, :abonent, :abonent_address,
  					      :consumer_category, :appeal_date, :attach_5_1]
  		when 2
  			fields = [:attach_5_2]
  		when 3
  			fields = [:attach_5_3]
  	end
  	self.serializable_hash(only: fields)
  end
end