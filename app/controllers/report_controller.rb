# -*- encoding : utf-8 -*-
class ReportController < ApplicationController
  skip_before_action :verify_authenticity_token

  def total
  	if request.post?
  		@day = params[:day].to_date
    else
    	@day = ( Time.now - 1.days )
  	end
  	@totals = SendQueue.where(stage: 1).where("SENT_AT BETWEEN TRUNC(:day ) AND TRUNC(:day + 1)", day: @day).group(:service).count(:service)
  	@max = @totals.max_by{|k,v| v}[1]
  end
end
