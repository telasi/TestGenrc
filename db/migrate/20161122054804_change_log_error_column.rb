class ChangeLogErrorColumn < ActiveRecord::Migration
  def change
  	change_column :log, :error, :string, :limit => 4000
  end
end
