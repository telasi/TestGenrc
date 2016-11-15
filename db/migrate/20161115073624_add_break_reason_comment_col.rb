class AddBreakReasonCommentCol < ActiveRecord::Migration
  def change
  	add_column :plannedoutages, :break_reason_comment, :string
  	add_column :crashoutages, :break_reason_comment, :string
  end
end
