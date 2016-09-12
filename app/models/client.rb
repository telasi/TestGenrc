class Client
  include HTTParty
  debug_output $stdout
  base_uri 'http://gnerc.org/cportal/public/api/v1/getlist'
  PHASE1_URL = ''
  PHASE2_URL = '/edit'
  
  def self.send(object)
    params = object.to_hash

  	microtime = Time.now.to_f.to_s
  	
  	checkcode = Digest::MD5.hexdigest( [Config::USERNAME, 
                  			  							Config::PASSWORD,
                  			  							Config::COMPANYID,
                  			  							microtime,
                  			  							Config::SECRET].join )

  	query_params = params.merge!({ username: Config::USERNAME,
                  								 password: Config::PASSWORD,
                  								 copmanyid: Config::COMPANYID,
                  								 microtime: microtime,
                  								 checkcode: checkcode,
                                   case_id:   object.class::CASE_ID })
    if object.stage > 1 
      query_params = query_params.merge!({ "case_details_#{object.class::CASE_ID}_id": object[:case_id] })
      url = PHASE2_URL
    else
      url = PHASE1_URL
    end

  	options = { query: query_params }
	  options.merge!({ body: params[:attributes] })

  	response = self.post(url, options)
  	answer = JSON.parse(response.parsed_response)
    answer
  end
end