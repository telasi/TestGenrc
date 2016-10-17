class CreatePlannedoutage < ActiveRecord::Migration
  def change
    create_table :plannedoutages do |t|
       t.binary :disabling_area   
       t.integer :break_reason 
       t.datetime :break_start_date
       t.datetime :break_end_date 
       t.integer :abonent_amount   
       t.string :self_governed_district_name 
       t.string :self_gov_district_ab_count
       t.integer :jit_infromation_consumer_count
       t.datetime :compare_date_2 
       t.string :list_of_media
       t.string :info_url
       t.string :sms
       t.string :record_status
       t.datetime :log_day
       t.string :response_id

    end
  end
end
