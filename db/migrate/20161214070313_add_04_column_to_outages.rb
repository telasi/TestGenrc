class Add04ColumnToOutages < ActiveRecord::Migration
  def change
  	add_column :plannedoutages, :outg_sys_type, :string
  	add_column :crashoutages, :outg_sys_type, :string
  end
end
