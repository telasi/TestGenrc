# -*- encoding : utf-8 -*-
class Cutter < ActiveRecord::Base
	self.table_name = 'cutter'

  CASE_ID = 3

  before_save :convert_geo
  
  def to_hash
  	case self.stage
      when 1
        { abonent_number:     self.abonent_number,
          abonent:            self.abonent.bs_str_to_ka, 
          abonent_type:       self.abonent_type,
          abonent_address:    self.abonent_address.bs_str_to_ka,
          arrear_date:        self.arrear_date.utc.strftime('%Y-%m-%d'),
          arrear_time:        self.arrear_date.utc.strftime('%H:%M'),
          transaction_number: self.transaction_number }
      when 2
        { transaction_number_2: self.transaction_number_2 }
      when 3
        { attach_3_3: self.attach_3_3 }
    end
  end

  private 

  def convert_geo
    self.gnerc_status_geo = self.gnerc_status.ka_str_to_bs
  end

end
