class CreatePlannedOutages < ActiveRecord::Migration
  def change
    create_table :planned_outages do |t|
      t.binary :disabling_area
      t.integer :break_reason
      t.integer :abonent_amount
      t.string :self_governed_district_name
      t.integer :self_governed_district_abonents_count
      t.integer :jit_infromation_consumer_count
      t.datetime :compare_date_2
      t.string :list_of_media
      t.string :info_url
      t.string :sms
      t.string :record_status
      t.datetime :log_day
      t.integer :response_id

      t.timestamps null: false
    end
  end
end
