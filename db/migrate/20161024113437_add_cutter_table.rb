class AddCutterTable < ActiveRecord::Migration
  def change
  	create_table :cutter do |t|
        t.integer   :transaction_number
    	t.integer 	:abonent_number
    	t.string    :abonent
    	t.string    :abonent_address
    	t.integer 	:abonent_type
    	t.date      :arrear_date
    	t.binary    :attach_3_1
    	t.binary    :attach_3_2
    	t.binary    :attach_3_3

        t.integer   :response_id
    	t.integer   :stage
    	t.datetime  :stage_1_date
    	t.datetime  :stage_2_date
    	t.datetime  :stage_3_date
    	t.timestamps null: false
    end
  end
end
