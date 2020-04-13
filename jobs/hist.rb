require 'sinatra'
use Rack::Logger

set :logger, Logger.new(STDOUT) # STDOUT & STDERR is captured by unicorn
Logger.info('starting hi info')

get '/fi' do
  # File.read(File.join('public', 'index.html'))
  Logger.info('query hi info')
  settings.history.to_yaml
end

File.write('assets/stylesheets/hi.css', settings.history.to_yaml)
