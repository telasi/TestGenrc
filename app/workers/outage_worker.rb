class OutageWorker
  #include Sidekiq::Worker

  #def perform
  #  OutageWorker.fill_outage_pl(Date.today)
  #end


  def self.fill_outage_pl(c_date)
  	
  	date=c_date.to_s

    PlOutage.delete_all(["log_day in (?)", [c_date]])       

    puts "///////////////////// work date ///////////////////////"
	puts c_date
	puts date	   
	puts "///////////////////// START WORKER ///////////////////////"
 	outagelog = OutageLog.where(log_day: c_date).where(outage_type: 'Planned')
            
 	if   !outagelog.nil?
 		outage_base_id =  OutageLog.select(:outage_base_id , :break_start_date , :break_end_date).where(log_day: date).where(outage_type: 'Planned').distinct

        outage_base_id.each do |bid|
 		     puts "///////////////////// SHOW BASE ID ///////////////////////" 
 		     puts bid.outage_base_id 
  		     puts bid.break_start_date 
  		     puts bid.break_end_date 
 		     puts "///////////////////// " 	
        	 # gatishuli abonentebis raodenoba	
        	 outagelog2=OutageLog.where(log_day: date).where(outage_base_id:  bid.outage_base_id).where(outage_type: 'Planned')
	         cust_n=outagelog2.distinct.count(:custkey_customer) 
 		     puts "///////////////////// SHOW CUST N ///////////////////////" 
             puts cust_n
             puts "///////////////////// " 	

             if cust_n>0
             	 out_ar=[]
			     outagelog2.each do |log|
				     # gatishvis areali qychebi
				     out_ar << log.streetname.to_s.strip.bs_str_to_en
			     end
			     out_ar.uniq!
			     out_ar=out_ar.join("-")
			     puts "///////////////////// SHOW ARIAL ///////////////////////"
			     puts out_ar

               outgnew=PlOutage.new

                 outgnew.disabling_area =  out_ar
				 outgnew.break_reason = 1  # droebiti
				 outgnew.break_start_date = bid.break_start_date
				 outgnew.break_end_date = bid.break_end_date
				 outgnew.disabling_consumer_count = cust_n
				 outgnew.abonent_amount = cust_n
			     outgnew.jit_infromation_consumer_count = cust_n
			     outgnew.info_url='news.ge'
			     outgnew.attach_1_1  = '1_1'
			     outgnew.attach_1_2  = '1_2'
			     outgnew.attach_1_4  = '1_4'  
			     outgnew.record_status = 'N'
                 outgnew.log_day = date.in_time_zone("UTC")    #in_time_zone("Tbilisi").strftime("%d%b%Y")
               outgnew.save!

              SendQueue.create(service: 'PlOutage', service_id: outgnew.id )


             end
        end	


    end

  end  # self.fill_outage_pl(c_date)	

end	 # class OutageWorker



#Sidekiq::Cron::Job.create(name: 'Outage Worker - once a day', cron: ' 30 09 * * *', class: 'OutageWorker')