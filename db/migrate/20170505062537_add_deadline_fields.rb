class AddDeadlineFields < ActiveRecord::Migration
  def change
  	add_column :docflow4, :deadline_to_response, :datetime
  	add_column :docflow5, :deadline_to_response, :datetime
  	add_column :docflow6, :deadline_to_response, :datetime
  	add_column :docflow8, :deadline_to_response, :datetime
  	add_column :newcust, :deadline_to_response, :datetime

  	add_column :docflow4, :compesation_amount, :string
  	add_column :docflow5, :compesation_amount, :string
  	add_column :docflow6, :compesation_amount, :string
  	add_column :docflow8, :compesation_amount, :string
  end
end
