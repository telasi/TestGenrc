# -*- encoding : utf-8 -*-
class Cutter < ActiveRecord::Base
	self.table_name = 'cutter'

  CASE_ID = 3
  
  def to_hash
  	case self.stage
      when 1
        { abonent_number:     self.abonent_number,
          abonent:            self.abonent, 
          abonent_type:       self.abonent_type,
          abonent_address:    self.abonent_address,
          arrear_date:        self.arrear_date.strftime('%Y-%m-%d'),
          arrear_time:        self.arrear_date.strftime('%H:%M'),
          transaction_number: self.transaction_number }
      when 2
        { attach_3_2: c.attach_3_2 }
      when 3
        { attach_3_3: c.attach_3_3 }
    end
  end

end
