require 'sinatra'
use Rack::Logger

set :logger, Logger.new(STDOUT) # STDOUT & STDERR is captured by unicorn

=begin
#NO ESTO CRE NEW SRVR get '/fi' do
  # File.read(File.join('public', 'index.html'))
  puts('query hi info')
  settings.history.to_yaml
=end

after do
  puts "jc - resp"
  puts response.status
end

puts('jc starting hi info')
puts( settings.history.to_yaml)
#File.write('assets/stylesheets/hi.css', settings.history.to_yaml)
#puts('jc starting hi info')
