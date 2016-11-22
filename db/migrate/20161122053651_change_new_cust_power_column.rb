class ChangeNewCustPowerColumn < ActiveRecord::Migration
  def change
  	change_column :newcust, :power, :string
  end
end
