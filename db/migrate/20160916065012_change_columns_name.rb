class ChangeColumnsName < ActiveRecord::Migration
  def change
    rename_column :pl_outages, :JIT_infromation_consumer_count, :jit_infromation_consumer_count
    rename_column :cr_outages, :JIT_switch_on_consumer_count, :jit_switch_on_consumer_count
    add_column :pl_outages, :log_day, :date
    add_column :cr_outages, :log_day, :date

  end

end

