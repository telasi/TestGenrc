# -*- encoding : utf-8 -*-
class Docflow4 < ActiveRecord::Base
  #include Base

  CASE_ID = 4

  self.table_name = 'docflow4'

  def self.start(params)
  	params.merge!({stage: 1, stage_1_date: Time.now})
  	docflow = Docflow4.create!(params)
    docflow.put_to_queue
  end

  def next_step(params)
    self.stage =+ 1
    params = params.except(:id).merge!({ "stage_#{self.stage}_date".to_sym => Time.now })
    self.update_attributes!(params.except(:id))
    self.put_to_queue
  end

  def send_to_gnerc
 	  Sender.perform_async('Docflow4', self.id)
  end

  def put_to_queue
    SendQueue.create!(service: 'Docflow4', service_id: self.id, stage: self.stage)
  end

  def to_hash
  	case self.stage
  		when 1
  			fields = [:letter_number, :abonent_number, :abonent, :abonent_address,
                  :abonent_type, :letter_category, :appeal_date, :attach_4_1]
  		when 2
  			fields = [:attach_4_2]
  		when 3
  			fields = [ :transaction_number_3, :the_amount_of_compensation ]
  	end
  	self.serializable_hash(only: fields)
  end
end