# -*- encoding : utf-8 -*-
class ReportController < ApplicationController
  def total
  	@totals = SendQueue.where(stage: 1).where("SENT_AT BETWEEN SYSDATE - 1 AND SYSDATE").group(:service).count(:service)
  	@max = @totals.max_by{|k,v| v}[1]
  end
end
