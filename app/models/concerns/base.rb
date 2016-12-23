require 'active_support/concern'

module Base
  extend ActiveSupport::Concern

  included do
	  def update_stage_date
	  	field = "stage_#{self.stage}_date"
	  	self.send(field + '=', Time.now) if self.respond_to?(field)
	  end
  end
  
end