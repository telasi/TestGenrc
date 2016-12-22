class AddGnercStatusColumn < ActiveRecord::Migration
  def change
  	add_column :plannedoutages,   :gnerc_status, :string
  	add_column :crashoutages,     :gnerc_status, :string
  	add_column :plannedoutage2s,  :gnerc_status, :string
  	add_column :crashoutage2s,    :gnerc_status, :string


  	add_column :cutter,   :gnerc_status, :string
  	add_column :docflow4,     :gnerc_status, :string
  	add_column :docflow5,  :gnerc_status, :string
  	add_column :docflow6,    :gnerc_status, :string
  	add_column :docflow8,   :gnerc_status, :string
  	add_column :newcust,     :gnerc_status, :string

  end
end
