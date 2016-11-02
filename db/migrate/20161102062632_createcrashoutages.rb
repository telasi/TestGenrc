class Createcrashoutages < ActiveRecord::Migration
  def change
    create_table :plannedoutages do |t|
 
       t.binary :disabling_area   
       t.integer :break_reason
       t.integer :break_type  
       t.integer :abonent_amount                 
       t.datetime :break_start_date
       t.datetime :break_start_time 
       t.integer :self_governed_district_name 
       t.integer :self_gov_district_ab_count
       t.datetime :information_dissemination_actual_date
       t.datetime :information_dissemination_actual_time 
       t.string :record_status
       t.datetime :log_day
       t.string :response_id
       t.timestamps 
    end  

  end
end
