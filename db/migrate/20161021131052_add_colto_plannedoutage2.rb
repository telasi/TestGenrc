class AddColtoPlannedoutage2 < ActiveRecord::Migration
  def change
  	add_column :plannedoutages, :outg_base_id, :number
  end
end
