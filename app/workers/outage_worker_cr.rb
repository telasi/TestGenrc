class OutageWorker
  include Sidekiq::Worker

  #def perform
   # OutageWorker.fill_outage_cr(Date.today)
  #end


def self.fill_outage_cr(c_date)
  	
  	date=c_date.to_s

    #CrOutage.delete_all(["log_day in (?)", [c_date]])       

    puts "///////////////////// work date ///////////////////////"
	puts c_date
	puts date	   
	puts "///////////////////// START WORKER ///////////////////////"
 	outagelog = OutageLog.where(log_day: c_date).where(outage_type: 'Crash').where(record_status:  'N')
            
 	if   !outagelog.nil?
puts "///////////////////// 1 ///////////////////////"



 		outages_cr_id =  OutageLog.select(:outage_cr_id , :break_start_date , :break_end_date).where(log_day: date).where(outage_type: 'Crash').where(record_status:  'N').distinct



        outages_cr_id.each do |bid|
 		     puts "///////////////////// SHOW CR ID ///////////////////////" 
 		     puts bid.outage_cr_id 
  		     puts bid.break_start_date 
  		     puts bid.break_end_date 
 		     puts "///////////////////// " 	
        	 # gatishuli abonentebis raodenoba	
        	 outagelog2=OutageLog.where(log_day: date).where(outage_cr_id:  bid.outage_cr_id).where(record_status:  'N')
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
               
               puts "///////////////////// SAVE CrOutage  ///////////////////////"
               outgnew=CrOutage.new

                 outgnew.disabling_area =  out_ar
				         outgnew.break_reason = 1  # droebiti
				         outgnew.break_type =1
                 outgnew.abonent_amount = cust_n
                 outgnew.disabling_consumer_count = cust_n
                 outgnew.jit_switch_on_consumer_count = cust_n
				         outgnew.break_start_date = bid.break_start_date.in_time_zone("UTC") #.strftime("%d-%b-%y")
				         outgnew.break_start_time = bid.break_start_date.in_time_zone("UTC") #.strftime("%H-%M-%S")
				         outgnew.info_url='news.ge'
			           outgnew.attach_2_1  = '2_1'
			           outgnew.attach_2_2  = '2_2'
			           outgnew.record_status = 'N'
                 outgnew.log_day = date.in_time_zone("UTC")    #in_time_zone("Tbilisi").strftime("%d%b%Y")
               outgnew.save!

              SendQueue.create(service: 'CrOutage', service_id: outgnew.id )


             end
        end	

 puts "///////////////////// 2 ///////////////////////"       
		outagelog.each do |up|
		 up.record_status = 'C'
		 up.save
	    end




    end

  end  # self.fill_outage_cr(c_date)

end	 # class OutageWorker



# Sidekiq::Cron::Job.create(name: 'Outage Worker - once a day', cron: ' 35 * * * *', class: 'OutageWorker')