class AddAcckeyCutter < ActiveRecord::Migration
  def change
  	add_column :cutter, :acckey, :integer, limit: 8
  	add_column :cutter, :mainaccount, :integer, limit: 1
  end
end
