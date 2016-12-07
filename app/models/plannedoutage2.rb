class Plannedoutage2 < ActiveRecord::Base

  self.table_name='plannedoutage2s'
  CASE_ID = 1
 
  def to_hash

  	case self.stage
      when 2
        { 
          break_start_actual_date:       self.break_start_actual_date,
          break_end_actual_date:         self.break_end_actual_date, 
          disabling_consumer_count:      self.disabling_consumer_count,
          transaction_number_4:          self.transaction_number_4,
          transaction_number_5:          self.transaction_number_5,
          postponed_suspend:             self.postponed_suspend
        }

    end
  end

end