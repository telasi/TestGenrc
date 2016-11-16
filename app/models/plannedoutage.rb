class Plannedoutage < ActiveRecord::Base

  self.table_name='plannedoutages'
  CASE_ID = 1
 
  def to_hash

  if !self.compare_date_2.nil? 
  	then compare_date_2=self.compare_date_2.strftime('%Y %m %d %H %M')
  end

  	case self.stage
      when 1
        { 
          disabling_area:                          self.disabling_area,
          break_reason:                            self.break_reason, 
          break_start_date:                        self.break_start_date.strftime('%Y-%m-%d %H:%M'),
          break_end_date:                          self.break_end_date.strftime('%Y-%m-%d %H:%M'),
          abonent_amount:                          self.abonent_amount,
          self_governed_district_name:             self.self_governed_district_name,
          self_governed_district_abonents_count:   self.self_gov_district_ab_count,
          JIT_infromation_consumer_count:          self.jit_infromation_consumer_count,          
          compare_date_2:                               compare_date_2,
          list_of_media:                           self.list_of_media,
          info_url:                                self.info_url,
          sms:                                     self.sms,
          break_reason_comment:                    self.break_reason_comment
        }

    end
  end

end