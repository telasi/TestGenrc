# -*- encoding : utf-8 -*-
class SoapController < ApplicationController
	soap_service namespace: 'urn:WashOut'

	soap_action "docflow_check",
				:args => { :docid => :integer,
						   :docyear => :string,
						   :docnumber => :string,
						   :abonent_number => :string,
						   :abonent => :string,
						   :abonent_address => :string,
						   :consumer_category => :integer,
						   :appeal_date => :datetime,
						   :attach_5_1 => :base64Binary },
				:return => :string

	def docflow_check
		Docflow.start(params)
		render :soap => params[:value].to_s
	end

	soap_action "docflow_check_answer",
				:args => { :docid => :integer,
						   :attach_5_2 => :base64Binary },
				:return => :string

	def docflow_check_answer
	    doc = Docflow.find(params[:docid])
	    doc.next_step(params)
		render :soap => params[:value].to_s
	end

end