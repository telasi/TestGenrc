class AddColumnToPloutages < ActiveRecord::Migration
  def change
  	add_column :plannedoutages, :outg_customers, :binary
  	add_column :crashoutages, :outg_customers, :binary  	
  end
end
