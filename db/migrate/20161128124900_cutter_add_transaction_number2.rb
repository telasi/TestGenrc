class CutterAddTransactionNumber2 < ActiveRecord::Migration
  def change
  	add_column :cutter, :transaction_number_2, :string
  end
end
