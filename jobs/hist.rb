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

  puts('jc -- hi info')
#ok  puts( settings.history.to_yaml)
#OK almacena  puts( Sinatra::Application.settings.history.to_yaml)
end

#File.write('assets/stylesheets/hi.css', settings.history.to_yaml)
#puts('jc starting hi info')
#
#Sinatra::Application.
