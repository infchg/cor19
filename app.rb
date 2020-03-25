require 'sinatra'

set :port, 3000   #do not hardcode 8080 
set :static, true
set :bind, '0.0.0.0'

get '/' do
    "Welcome to Sinatra!" 
end
