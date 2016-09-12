class Log < ActiveRecord::Base
  self.table_name = 'log'

  def add(object, id, action)
  	Log.create!
  end
end