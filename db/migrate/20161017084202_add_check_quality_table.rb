class AddCheckQualityTable < ActiveRecord::Migration
  def change
  	create_table :docflow8 do |t|
        t.integer   :docid
        t.integer   :docyear
        t.string    :letter_number
    	t.integer 	:abonent_number
    	t.string    :abonent
    	t.string    :abonent_address
    	t.integer 	:abonent_type
    	t.date      :appeal_date
    	t.binary    :attach_4_1
    	t.binary    :attach_4_2
    	t.binary    :attach_4_3

        t.integer   :response_id
    	t.integer   :stage
    	t.datetime  :stage_1_date
    	t.datetime  :stage_2_date
    	t.datetime  :stage_3_date
    	t.timestamps null: false
    end

    rename_column :docflow4, :docnumber, :letter_number
  	add_column :docflow4, :letter_category, :integer

  	rename_column :docflow5, :docnumber, :letter_number

  	rename_column :docflow6, :docnumber, :letter_number
  end
end
