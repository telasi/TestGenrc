# -*- encoding : utf-8 -*-
class ReportController < ApplicationController
  skip_before_action :verify_authenticity_token

  STATUS_OK = 'დასრულებულია'
  STATUS_LATE = 'არ არის დასრულებული'

  def total
  	if request.post?
  		@day = params[:day].to_date
    else
    	@day = ( Time.now - 1.days )
  	end
  	@totals = SendQueue.where(stage: 1).where("SENT_AT BETWEEN TRUNC(:day ) AND TRUNC(:day + 1)", day: @day).group(:service).count(:service)
  	@max = @totals.max_by{|k,v| v}[1]
  end

  def report
    if request.post?
      @fromday = params[:fromday].to_date
      @today = params[:today].to_date
    else
      @fromday = ( Time.now - 1.month )
      @today = ( Time.now - 1.days )
    end
    query = "select * 
              from (select 
                            (case substr(to_char(service), 1, 10)
                               when 'Crashoutag' then 'Crashoutage'
                               when 'Plannedout' then 'Plannedoutage'
                               else service
                             end) service, 
                            action 
                            from log 
                            where created_at >= to_date('#{@fromday.strftime('%Y-%m-%d')}','YYYY-MM-DD')
                            and created_at <= to_date('#{@today.strftime('%Y-%m-%d')}','YYYY-MM-DD')
                            and success = 1)
              pivot (count(*) as count_action for action in ('send 1' as send1, 'send 2' as send2, 'send 3' as send3))"
    @array = ActiveRecord::Base.connection.exec_query(query).to_a
    debugger
    @array
  end

  def reestr
    if request.post?
      @fromday = params[:fromday].to_date
      @today = params[:today].to_date
    else
      @fromday = ( Time.now - 1.month )
      @today = ( Time.now - 1.days )
    end

    @array = []

    d4rel = Docflow4.where(appeal_date: @fromday..@today)

    docflow4 = d4rel.group(:letter_category).count
    docflow4 = docflow4.sort_by{ |key, val| key }
    docflow4.each do |doc|
      dcat = d4rel.where(letter_category: doc[0])

      row = { type: doc[0],
              total: doc[1],
              current_late: dcat.where(stage: 1).where('appeal_date <= ?', (Time.now - 10.days)).count,
              current_ok: dcat.where(stage: 1).where('appeal_date > ?', (Time.now - 10.days)).count,
              answered_late: dcat.where(stage: 2).where('stage_2_date <= ?', (Time.now - 10.days)).count,
              answered_ok: dcat.where(stage: 2).where('stage_2_date > ?', (Time.now - 10.days)).count
               }

      # row = { type: doc[0],
      #         total: doc[1],
      #         current_late: dcat.where(stage: 1).where(gnerc_status: STATUS_LATE).count,
      #         current_ok: dcat.where(stage: 1).where(gnerc_status: STATUS_OK).count,
      #         answered_late: dcat.where(stage: 2).where(gnerc_status: STATUS_LATE).count,
      #         answered_ok: dcat.where(stage: 2).where(gnerc_status: STATUS_OK).count
      #          }
      @array << row
    end

    d5rel = Docflow5.where(appeal_date: @fromday..@today)
    fill_array(d5rel, @array, 1005, 10)

    d6rel = Docflow6.where(appeal_date: @fromday..@today)
    fill_array(d6rel, @array, 1006, 5)

    d8rel = Docflow8.where(appeal_date: @fromday..@today)
    fill_array(d8rel, @array, 1008, 5)

    # newcustrel = Newcust.where(appeal_date: @fromday..@today)
    # fill_array(newcustrel, @array, 1007)

  end

  private 

  def fill_array(rel, array, name, deadline)
    row = { type: name,
            total: rel.count,
            current_late: rel.where(stage: 1).where('appeal_date <= ?', (Time.now - deadline.days)).count,
            current_ok: rel.where(stage: 1).where('appeal_date > ?', (Time.now - deadline.days)).count,
            answered_late: rel.where(stage: 2).where('stage_2_date <= ?', (Time.now - deadline.days)).count,
            answered_ok: rel.where(stage: 2).where('stage_2_date > ?', (Time.now - deadline.days)).count
            }

    # row = { type: name,
    #         total: rel.count,
    #         current_late: rel.where(stage: 1).where(gnerc_status: STATUS_LATE).count,
    #         current_ok: rel.where(stage: 1).where(gnerc_status: STATUS_OK).count,
    #         answered_late: rel.where(stage: 2).where(gnerc_status: STATUS_LATE).count,
    #         answered_ok: rel.where(stage: 2).where(gnerc_status: STATUS_OK).count
    #         }
    array << row
  end

end
