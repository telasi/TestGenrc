class ModifyColUtages2 < ActiveRecord::Migration
	def change
	    rename_column :plannedoutage2s, :ransaction_number_4, :transaction_number_4
	    rename_column :plannedoutage2s, :ransaction_number_5, :transaction_number_5
	end
end