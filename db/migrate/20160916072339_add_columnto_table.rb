class AddColumntoTable < ActiveRecord::Migration
  def change
  	add_column :cr_outages, :disabling_area, :binary
    add_column :pl_outages, :disabling_area, :binary    
  end
end
