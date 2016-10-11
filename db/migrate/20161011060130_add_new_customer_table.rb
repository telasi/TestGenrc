class AddNewCustomerTable < ActiveRecord::Migration
  def change
  	create_table :newcust do |t|
        t.string    :number
        t.string    :applicant
        t.string    :applicant_address
        t.string 	:voltage
        t.float 	:power
    	t.date      :appeal_date
    	t.binary    :attach_7_1
    	t.binary    :attach_7_2
    	t.binary    :attach_7_3

        t.integer   :response_id
    	t.integer   :stage
    	t.datetime  :stage_1_date
    	t.datetime  :stage_2_date
    	t.datetime  :stage_3_date
    	t.timestamps null: false
    end
  end
end
