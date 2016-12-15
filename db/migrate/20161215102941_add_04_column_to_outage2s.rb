class Add04ColumnToOutage2s < ActiveRecord::Migration
  def change
  	add_column :plannedoutage2s, :outg_sys_type, :string
  	add_column :crashoutage2s, :outg_sys_type, :string
  end
end
