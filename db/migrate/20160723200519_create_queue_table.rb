class CreateQueueTable < ActiveRecord::Migration
  def change
    create_table :queue do |t|
    	t.string  	:service
    	t.integer 	:service_id
    	t.integer 	:stage
    	t.datetime  :sent_at

    	t.timestamps null: false
    end
  end
end
