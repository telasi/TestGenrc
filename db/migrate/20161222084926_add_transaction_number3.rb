class AddTransactionNumber3 < ActiveRecord::Migration
  def change
  	add_column :cutter, :gnerc_status_geo, :string
  	add_column :cutter, :transaction_number_3, :string
  	add_column :cutter, :the_amount_of_compensation, :string

  	add_column :docflow4, :transaction_number_3, :string
  	add_column :docflow4, :the_amount_of_compensation, :string

  	add_column :docflow5, :transaction_number_3, :string
  	add_column :docflow5, :the_amount_of_compensation, :string

  	add_column :docflow6, :transaction_number_3, :string
  	add_column :docflow6, :the_amount_of_compensation, :string
  	add_column :docflow6, :assigned_abonent_number, :string

  	add_column :docflow8, :transaction_number_3, :string
  	add_column :docflow8, :the_amount_of_compensation, :string
  end
end
