class AddFilenameColumns < ActiveRecord::Migration
  def change
  	add_column :docflow4, :attach_4_1_filename, :string
  	add_column :docflow4, :attach_4_2_filename, :string
  	add_column :docflow4, :attach_4_3_filename, :string
  	
  	add_column :docflow5, :attach_5_1_filename, :string
  	add_column :docflow5, :attach_5_2_filename, :string
  	add_column :docflow5, :attach_5_3_filename, :string

  	add_column :docflow6, :attach_6_1_filename, :string
  	add_column :docflow6, :attach_6_2_filename, :string
  	add_column :docflow6, :attach_6_3_filename, :string

  	add_column :docflow8, :attach_8_1_filename, :string
  	add_column :docflow8, :attach_8_2_filename, :string
  	add_column :docflow8, :attach_8_3_filename, :string

  	add_column :newcust, :attach_7_1_filename, :string
  	add_column :newcust, :attach_7_2_filename, :string
  	add_column :newcust, :attach_7_3_filename, :string
  end
end