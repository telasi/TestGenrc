class Createcrashoutages < ActiveRecord::Migration
  def change
    create_table :crashoutages do |t|
 
       t.binary :disabling_area   
       t.integer :break_reason
       t.integer :break_type  
       t.integer :abonent_amount                 
       t.datetime :break_start_date
       t.datetime :break_start_time 
       t.integer :self_governed_district_name 
       t.integer :self_gov_district_ab_count
       t.datetime :inf_dissemination_actual_date
       t.datetime :inf_dissemination_actual_time 
       t.string :record_status
       t.datetime :log_day
       t.string :response_id
	   t.string :outg_base_description
	   t.string :outg_comment
	   t.integer :outg_base_id
	   t.integer :stage
       t.timestamps 
    end  

  end
end
