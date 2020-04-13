require 'dashing'

configure do
  set :auth_token, 'caUTH_TOKEN'

#  set :logging, Logger::INFO
  #jc

  # See http://www.sinatrarb.com/intro.html > Available Template Languages on
  # how to add additional template languages.
  set :template_languages, %i[html erb]

  helpers do
    def protected!
      # Put any authentication code you want in here.
      # This method is run before accessing any resource.
    end
  end

  #jc Sinatra::Application.   post '/widgets/:id' do
  after do 
    puts "jc after - resp"
    puts response.status
    puts '[Params]'
    p params
    puts JSON.parse(request.body.read)
    puts "jc after - ]"
  end

end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application
