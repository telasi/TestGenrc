# -*- encoding : utf-8 -*-
class Cutter < ActiveRecord::Base
  include Base
  
	self.table_name = 'cutter'

  CASE_ID = 3

  before_save :convert_geo, :convert_ka
  
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
        { transaction_number_3:       self.transaction_number_3,
          the_amount_of_compensation: self.the_amount_of_compensation }
    end
  end

  private 

  def convert_geo
    self.gnerc_status_geo = self.gnerc_status.ka_str_to_bs if self.gnerc_status
  end

  def convert_ka
    self.note_ka = self.note.bs_str_to_ka if self.note
  end

end
