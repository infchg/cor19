require 'dashing'

configure do
  set :auth_token, 'caUTH_TOKEN'

#  set :logging, Logger::INFO
  #jc
#jcliab= Hash.new { 'var2' => [] }
  $jcliab= Hash.new {  []  }


  # See http://www.sinatrarb.com/intro.html > Available Template Languages on
  # how to add additional template languages.
  set :template_languages, %i[html erb]

  helpers do
    def protected!
      # Put any authentication code you want in here.
      # This method is run before accessing any resource.
    end
  end

  before '/widgets/:id' do
    puts "[j:  "
    pid= params['id']
    puts "j: par= #{pid} "
    bo= request.body.read
    pil=$jcliab[ pid ]
    pil.push( bo )
    $jcliab[ pid ]=pil
    puts "keys= #{$jcliab.keys} len= #{$jcliab.keys} bod= #{bo} " 
    puts 'j: ]'
  end

  #jc Sinatra::Application.   post '/widgets/:id' do
  after do 
    if response.status == 204  
       puts "[after #{params.keys} " #bodlen=#{  deleted body.length} "
       #vacios p params puts body  # 
       request.body.rewind
       boo= JSON.parse(request.body.read)
       puts "bole=#{boo.keys} pid= #{boo.length} ['id']} - after - ]"
       #print body
       ## TENGO ESTO SI : 
       ## OK Hash puts settings.history.keys #:w  to_yaml
       puts ' after]'
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
