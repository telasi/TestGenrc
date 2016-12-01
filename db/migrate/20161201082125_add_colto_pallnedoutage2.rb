class AddColtoPallnedoutage2 < ActiveRecord::Migration
  def change
     create_table   :plannedoutage2s do |t|
		 t.datetime    :break_start_actual_date
		 t.datetime    :break_end_actual_date
		 t.integer     :disabling_consumer_count, limit: 10
		 t.string      :ransaction_number_4 , limit: 10
		 t.string      :ransaction_number_5 , limit: 10
		 t.text        :postponed_suspend 
         t.string      :record_status, limit: 10
         t.datetime    :log_day
         t.string      :outg_base_id, limit: 10
         t.decimal     :stage , limit: 3      
         t.string      :outg_comment  
         t.timestamps  null: false    
         t.string      :linked_base_id, limit: 10
    end
  end
end
