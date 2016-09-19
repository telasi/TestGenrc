class RemoveFieldNameFromTable < ActiveRecord::Migration
  def change
    remove_column :cr_outages, :disabling_area
    remove_column :pl_outages, :disabling_area    
  end
end
