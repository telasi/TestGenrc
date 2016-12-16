class Add04ColumnToOutage2s2 < ActiveRecord::Migration
  def change
  	add_column :plannedoutage2s, :response_id, :number
  	add_column :crashoutage2s, :response_id, :number
  end
end
