class AddColstoPlannedoutage < ActiveRecord::Migration
  def change
   	add_column :plannedoutages, :outg_base_description, :string
    add_column :plannedoutages, :outg_comment, :string          
   end
end
