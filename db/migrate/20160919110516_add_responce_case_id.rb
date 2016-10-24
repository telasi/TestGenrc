class AddResponceCaseId < ActiveRecord::Migration
  def change

   rename_column :docflow, :case_id, :response_id

  end
end
