require 'dashing'

configure do
  set :auth_token, 'caUTH_TOKEN'

#  set :logging, Logger::INFO
  #jc

  # See http://www.sinatrarb.com/intro.html > Available Template Languages on
  # how to add additional template languages.
  set :template_languages, %i[html erb]

  #jclab= Hash.new { 'var2' => [] }
  jclab= Hash.new {  []  }

  helpers do
    def protected!
      # Put any authentication code you want in here.
      # This method is run before accessing any resource.
    end
  end

  before '/widgets/:id' do
    puts '[jc: ',params['id']
    puts request.body.read
    #p configure.jclab
    jclab[ params['id'] ].push(  request.body.read  )

    p jclab
    puts 'jc: ]'
  end

  #jc Sinatra::Application.   post '/widgets/:id' do
  after do 
    if response.status == 204 
       puts '[Params]'
       p params
       puts body  # JSON.parse(request.body.read)
       puts params['id'],"- after - ]"
       print body
       ## TENGO ESTO SI : 
       puts settings.history.class #:w  to_yaml
       puts '[end afte]'
       #rompe if no yaml puts Sinatra::Application.settings.history[id]
    end   
  end


  #overide  did not
  def send_event(id, body, target=nil)
    body[:id] = id
    puts "jc: --",id, body, target  ## JC OVE NEW
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
