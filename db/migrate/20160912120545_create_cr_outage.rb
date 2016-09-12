class CreateCrOutage < ActiveRecord::Migration
  def change
    create_table :cr_outages do |t|

	 t.string :disabling_area
	 t.integer :break_reason
	 t.integer :break_type
	 t.integer :abonent_amount
     t.integer :disabling_consumer_count
     t.integer :JIT_switch_on_consumer_count    
	 t.datetime :break_start_date
	 t.datetime :break_start_time
     t.string :info_url
     t.binary :attach_2_1
     t.binary :attach_2_2     
     t.string :record_status

     t.timestamps null: false


    end
  end
end
