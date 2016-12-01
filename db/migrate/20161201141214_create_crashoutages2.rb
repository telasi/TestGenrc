class CreateCrashoutages2 < ActiveRecord::Migration
  def change
    create_table :crashoutage2s do |t|

    	 t.integer     :break_type , limit: 2
		 t.integer     :disabling_consumer_count, limit: 8
		 t.integer     :jit_switch_on_consumer_count, limit: 8
         t.datetime    :compare_time_2
         t.string      :attach_2_1

         t.datetime    :inf_dissemination_actual_date
         t.datetime    :inf_dissemination_actual_time
         t.integer     :disabling_consumer_count
         t.integer     :jit_infromation_consumer_count
         t.string      :info_url
         t.string      :list_of_media
         t.string      :sms

         t.string      :record_status, limit: 10
         t.datetime    :log_day
         t.string      :outg_base_id, limit: 10
         t.integer     :stage , limit: 3      
         t.string      :outg_comment  
         t.timestamps  null: false 

    end
  end
end
