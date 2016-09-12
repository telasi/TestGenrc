# -*- encoding : utf-8 -*-
class SendQueue < ActiveRecord::Base
  self.table_name = 'queue'

  def self.not_sent
  	SendQueue.where(sent_at: nil)
  end
end