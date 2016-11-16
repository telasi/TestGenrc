class ChangeNewCustTable < ActiveRecord::Migration
  def change
  	rename_column :newcust, :number, :letter_number
  	add_column :newcust, :transaction_number_3, :string
  	add_column :newcust, :the_amount_of_compensation, :string
  	add_column :newcust, :attach_7_4, :binary
  end
end
