require 'sinatra'
use Rack::Logger

set :logger, Logger.new(STDOUT) # STDOUT & STDERR is captured by unicorn
puts('starting hi info')

get '/fi' do
  # File.read(File.join('public', 'index.html'))
  puts('query hi info')
  settings.history.to_yaml
end

File.write('assets/stylesheets/hi.css', settings.history.to_yaml)
