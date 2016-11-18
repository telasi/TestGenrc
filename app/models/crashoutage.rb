class Crashoutage < ActiveRecord::Base

  self.table_name='crashoutages'
  CASE_ID = 2
 
  def to_hash


  	case self.stage
      when 1
        { 
          disabling_area:                          self.disabling_area,
          break_reason:                            self.break_reason, 
          break_reason_comment:                    self.break_reason_comment,       
          break_start_date:                        self.break_start_date.strftime('%Y-%m-%d'),
          break_start_time:                        self.break_start_time.strftime('%H:%M:%S'),
          abonent_amount:                          self.abonent_amount,
          self_governed_district_name:             self.self_governed_district_name,
          self_governed_district_abonents_count:   self.self_gov_district_ab_count,
          break_reason_comment:                    self.break_reason_comment
        }

    end
  end

end