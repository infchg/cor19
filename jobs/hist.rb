#sera que lo pido ZZrequire 'sinatra'
#use Rack::Logger

#set :logger, Logger.new(STDOUT) # STDOUT & STDERR is captured by unicorn

=begin
#NO ESTO CRE NEW SRVR get '/fi' do
  # File.read(File.join('public', 'index.html'))
  puts('query hi info')
  settings.history.to_yaml


Sinatra::Application.after post '/widgets/:id' do
  puts "jc after - resp"
  puts response.status
  puts '[Params]'
  p params
  puts JSON.parse(request.body.read)
  puts "jc after - ]"
end
=end

SCHEDULER.every "5m", :first_in => 0   do |job|

  puts('jc -- hist 15m info')
  labels = [ "aa","b2","c3","d4" ]
  data = [  
      {
        label: "Inin label",
        data: [14,19,49,17],
        borderColor: "red",
        backgroundColor: "yellow",
        borderWidth: 1,
      }
    ]
  
  opt = { tooltips: { mode: 'index', intersect: false, },
                                  hover: { mode: 'nearest', intersect: true }
  }
  
  send_event('pdl', { labels: labels, datasets: data, options: opt })
  send_event('pbl', { labels: labels, datasets: data, options: opt })
  send_event('pbl2', { labels: labels, datasets: data, options: opt })
  send_event('d1', { labels: 'hoy', datasets: '4' })
  
#ok  puts( settings.history.to_yaml)
#OK almacena  puts( Sinatra::Application.settings.history.to_yaml)
end

#File.write('assets/stylesheets/hi.css', settings.history.to_yaml)
#puts('jc starting hi info')
#
#Sinatra::Application.
