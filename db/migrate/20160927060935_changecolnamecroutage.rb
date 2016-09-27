class Changecolnamecroutage < ActiveRecord::Migration
  def change
  	rename_column :cr_outages, :JIT_switch_on_consumer_count, :jit_switch_on_consumer_count
  	add_column :cr_outages, :log_day, :date
  end
end
