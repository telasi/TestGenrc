class AddColumnsToOutages1 < ActiveRecord::Migration
  def change
     add_column :plannedoutages, :comment1,  :string
     add_column :plannedoutages, :comment2,  :string
     add_column :plannedoutages, :comment3,  :string     
     add_column :plannedoutages, :notify_time,  :datetime


     add_column :crashoutages, :comment1,  :string
     add_column :crashoutages, :comment2,  :string
     add_column :crashoutages, :comment3,  :string     
     add_column :crashoutages, :notify_time,  :datetime


  end
end
