class AddColumntToNewcust < ActiveRecord::Migration
  def change
  	add_column :newcust, :attach_7_4_filename, :string
  end
end
