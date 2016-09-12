class CreateTel100Table < ActiveRecord::Migration
  def change
    create_table :docflow do |t|
        t.integer   :docid
        t.integer   :docyear
        t.string    :docnumber
    	t.integer 	:abonent_number
    	t.string    :abonent
    	t.string    :abonent_address
    	t.integer 	:consumer_category
    	t.date      :appeal_date
    	t.binary    :attach_5_1
    	t.binary    :attach_5_2
    	t.binary    :attach_5_3

        t.integer   :case_id
    	t.integer   :stage
    	t.datetime  :stage_1_date
    	t.datetime  :stage_2_date
    	t.datetime  :stage_3_date
    	t.timestamps null: false
    end
  end
end
