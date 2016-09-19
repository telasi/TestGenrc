class CreatePlOutage < ActiveRecord::Migration
  def change
    create_table :pl_outages do |t|

	 t.string :disabling_area
	 t.string :break_reason
	 t.datetime :break_start_date
	 t.datetime :break_end_date
	 t.integer :disabling_consumer_count
	 t.integer :abonent_amount
     t.integer :jit_infromation_consumer_count
     t.string :info_url
     t.binary :attach_1_1
     t.binary :attach_1_2
     t.binary :attach_1_4
     t.string :record_status

     t.timestamps null: false
    end
  end
end
