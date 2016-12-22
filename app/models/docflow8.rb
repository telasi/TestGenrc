# -*- encoding : utf-8 -*-
class Docflow8 < ActiveRecord::Base
	self.table_name = 'docflow8'

  CASE_ID = 8
  
  def to_hash
  	case self.stage
      when 1
        fields = [:letter_number, :abonent_number, :abonent,
                  :abonent_address, :consumer_category, :appeal_date, :attach_8_1]
      when 2
        fields = [:attach_8_2]
      when 3
        fields = [ :transaction_number_3, :the_amount_of_compensation ]
    end
    self.serializable_hash(only: fields)
  end

end
