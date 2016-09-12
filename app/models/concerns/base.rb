require 'active_support/concern'

module Base
  extend ActiveSupport::Concern

  included do
    after_save :save_to_log
  end

  def save_to_log
  	Log.create!(service: self.class.name, service_id: self.id, action: 'save', success: 1)
  end
end