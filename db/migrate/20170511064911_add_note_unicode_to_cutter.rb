class AddNoteUnicodeToCutter < ActiveRecord::Migration
  def change
  	add_column :cutter, :note_ka, :string
  end
end
