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
    if response.status == 204 
       puts '[Params]'
       p params
       puts body  # JSON.parse(request.body.read)
       puts params['id'],"- after - ]"
       print body
       puts Sinatra::Application.settings.history[id]
    end   
  end


  #overide
  def send_event(id, body, target=nil)
    body[:id] = id
    puts "jc -",id, body, target
    body[:updatedAt] ||= Time.now.to_i
    event = format_event(body.to_json, target)
    Sinatra::Application.settings.history[id] = event unless target == 'dashboards'
    Sinatra::Application.settings.connections.each { |out| out << event }
  end



end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application
