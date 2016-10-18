class ChangeCheckQualityFields < ActiveRecord::Migration
  def change
  	rename_column :docflow8, :abonent_type, :consumer_category
  	rename_column :docflow8, :attach_4_1, :attach_8_1
  	rename_column :docflow8, :attach_4_2, :attach_8_2
  	rename_column :docflow8, :attach_4_3, :attach_8_3
  end
end
