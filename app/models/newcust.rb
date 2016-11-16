# -*- encoding : utf-8 -*-
class Newcust < ActiveRecord::Base
	self.table_name = 'newcust'

  CASE_ID = 7
  
  def to_hash
  	case self.stage
      when 1
        fields = [:letter_number, :applicant, :applicant_address, :voltage,
                  :power, :appeal_date, :attach_7_1]
      when 2
        fields = [:attach_7_2, :attach_7_4]
      when 3
        fields = [:transaction_number_3, :the_amount_of_compensation]
    end
    self.serializable_hash(only: fields)
  end

end
