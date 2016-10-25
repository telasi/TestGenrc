class AddColumnToPlannedoutage < ActiveRecord::Migration
  def change
  	add_column :plannedoutages, :stage, :number
  end
end
