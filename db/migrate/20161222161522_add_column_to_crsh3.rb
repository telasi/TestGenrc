class AddColumnToCrsh3 < ActiveRecord::Migration
  def change
  	  	add_column :crashoutage3s,    :outg_sys_type, :string
  	  	add_column :crashoutage3s,    :response_id, :number
  	  	add_column :crashoutage3s,    :gnerc_status, :string
  end
end


