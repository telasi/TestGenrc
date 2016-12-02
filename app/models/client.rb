class Client
  include HTTParty

  debug_output $stdout
  base_uri 'http://gnerc.org/cportal/public/api/v1/getlist'
  PHASE1_URL = ''
  PHASE2_URL = '/edit'
  
  def self.send(object)

    params = object.to_hash

  	microtime = Time.now.to_f.to_s
  	
    if object.stage > 1 

      case_detail = "case_details_10#{object.class::CASE_ID}_id"
      #byebug
      checkcode = Digest::MD5.hexdigest( [Config::USERNAME, 
                                        Config::PASSWORD,
                                        Config::COMPANYID,
                                        microtime,
                                        Config::SECRET,
                                        object[:response_id] ].join )

      query_params = params.merge!({ username: Config::USERNAME,
                                   password: Config::PASSWORD,
                                   copmanyid: Config::COMPANYID,
                                   microtime: microtime,
                                   checkcode: checkcode,
                                   case_id:   object.class::CASE_ID })


      query_params = query_params.merge!({ "#{case_detail}" => object[:response_id] })
      url = PHASE2_URL
    else
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

      url = PHASE1_URL
    end

  	options = { query: query_params }
	  options.merge!({ body: params[:attributes] })

  	response = self.post(url, options)
  	answer = JSON.parse(response.parsed_response)
    answer
  end

  require "net/http"
  require "uri"


  def self.send_b(object, stage=1)

    microtime = Time.now.to_f.to_s
    
    checkcode = Digest::MD5.hexdigest( [Config::USERNAME, 
                                        Config::PASSWORD,
                                        Config::COMPANYID,
                                        microtime,
                                        Config::SECRET].join)

   username = Config::USERNAME
   password = Config::PASSWORD
   copmanyid = Config::COMPANYID
   case_id = object.class::CASE_ID

   general_parameters = "?username=#{username}&password=#{password}&checkcode=#{checkcode}&copmanyid=#{copmanyid}&microtime=#{microtime}&case_id=#{case_id}"

   if object.stage > 1
    full_uri = base_uri + PHASE2_URL + general_parameters + "&case_details_10#{object.class::CASE_ID}_id=#{object[:response_id]}"
   else
    full_uri = base_uri + PHASE1_URL + general_parameters
   end

   uri = URI.parse(full_uri)

   #uri = URI.parse("http://gnerc.org/cportal/public/api/v1/getlist?username=#{username}&password=#{password}&checkcode=#{checkcode}&copmanyid=#{copmanyid}&microtime=#{microtime}&case_id=#{case_id}")
   
    #response = Net::HTTP.get_response(uri)
      puts "##########1110##########"
      puts  uri.host 
      puts uri.request_uri
    

      # Full control
      http = Net::HTTP.new(uri.host, uri.port)

      puts "##########1111###GET#######"      
      puts uri.request_uri
    
      request = Net::HTTP::Post.new(uri.request_uri)

      object.stage = stage
      query_params = object.to_hash

      request.set_form_data( query_params )    
   
      puts "##########1112###POST#######"    
      puts  uri.host 


    response = http.request(request)
    #byebug
    puts "##########2222###RESP#######"
    puts response.code
    puts response.message    
    puts response.body

    begin
      answer = JSON.parse(response.body)
    rescue

    ensure
      answer
    end
  end


end