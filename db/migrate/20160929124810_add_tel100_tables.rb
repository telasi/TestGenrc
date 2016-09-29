class AddTel100Tables < ActiveRecord::Migration
  def change

  	rename_table :docflow, :docflow5

    create_table :docflow4 do |t|
        t.integer   :docid
        t.integer   :docyear
        t.string    :docnumber
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

    create_table :docflow6 do |t|
        t.integer   :docid
        t.integer   :docyear
        t.string    :docnumber
    	t.string    :applicant
    	t.string    :applicant_address
    	t.integer 	:abonent_number
    	t.integer 	:consumer_category
    	t.date      :appeal_date
    	t.binary    :attach_6_1
    	t.binary    :attach_6_2
    	t.binary    :attach_6_3

        t.integer   :response_id
    	t.integer   :stage
    	t.datetime  :stage_1_date
    	t.datetime  :stage_2_date
    	t.datetime  :stage_3_date
    	t.timestamps null: false
    end
  end
end
