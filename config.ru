# This file is used by Rack-based servers  to start

#ex1   require './hi'
# run Rails.application

#ex2   require './app'
#run Sinatra::Application

#ex3   
require './hello'
run HelloApp

#ex4
require 'dashing'

configure do
  set :auth_token, 'YOUR_AUTH_TOKEN'

  helpers do
    def protected!
      # Put any authentication code you want in here.
      # This method is run before accessing any resource.
    end
  end
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application

