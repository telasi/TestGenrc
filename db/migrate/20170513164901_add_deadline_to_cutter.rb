class AddDeadlineToCutter < ActiveRecord::Migration
  def change
  	add_column :cutter, :deadline_to_response, :datetime
  	add_column :cutter, :compesation_amount, :string
  end
end
