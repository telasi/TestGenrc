class Crashoutage2 < ActiveRecord::Base

  self.table_name='crashoutage2s'
  CASE_ID = 2
 
  def to_hash

  if !self.compare_date_2.nil? 
  	then compare_date_2=self.compare_date_2.strftime('%Y-%m-%d')
  end

  if !self.compare_time_2.nil? 
    then compare_time_2=self.compare_time_2.strftime('%H:%M:%S')
  end


  	case self.stage
      when 2
        { 
          break_type:                              self.break_type,
          disabling_consumer_count:                self.disabling_consumer_count, 
          JIT_switch_on_consumer_count:            self.jit_switch_on_consumer_count,
          compare_date_2:                            compare_date_2,
          compare_time_2:                            compare_time_2,
          transaction_number_5:                    self.attach_2_1,

          information_dissemination_actual_date:   self.inf_dissemination_actual_date,
          information_dissemination_actual_date:   self.inf_dissemination_actual_time,
          disabling_consumer_count:                self.disabling_consumer_count, 
          JIT_infromation_consumer_count:          self.jit_infromation_consumer_count,
          list_of_media:                           self.list_of_media,
          info_url:                                self.info_url,
          sms:                                     self.sms

        }

    end
  end

end