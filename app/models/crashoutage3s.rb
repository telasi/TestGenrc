class Crashoutage3 < ActiveRecord::Base

  self.table_name='crashoutage3s'
  CASE_ID = 2
 
  def to_hash

  if !self.compare_date_2.nil? 
  	then compare_date_2=self.compare_date_2.strftime('%Y-%m-%d')
  end

  if !self.compare_time_2.nil? 
    then compare_time_2=self.compare_time_2.strftime('%H:%M:%S') 
  end


  	case self.stage
      when 3
        { 
          JIT_switch_on_consumer_count:            self.jit_switch_on_consumer_count,
          compare_date_2:                            compare_date_2,
          compare_time_2:                            compare_time_2,
          transaction_number_5:                    self.attach_2_1,
          response_id:                             self.attach_2_1
        }

    end
  end

end