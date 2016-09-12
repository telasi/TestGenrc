class CreateLogTable < ActiveRecord::Migration
  def change
    create_table :log do |t|
    	t.string  :service
    	t.integer :service_id
    	t.string  :action
    	t.boolean :success
    	t.string  :error

    	t.timestamps null: false
    end
  end
end
