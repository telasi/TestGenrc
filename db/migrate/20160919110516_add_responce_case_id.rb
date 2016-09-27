class AddResponceCaseId < ActiveRecord::Migration
  def change

  	add_column :cr_outages, :response_id, :integer
    add_column :pl_outages, :response_id, :integer    

    rename_column :docflow, :case_id, :response_id

  end
end
