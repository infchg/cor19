#web: dashing new tt
#worker: bundle install  # check # to get gemfile.lock aligned
# hello.rb:1:in `require': cannot load such file -- sinatra (LoadError)   web: bundle exec ruby hello.rb  
#web: bundle exec rackup -o 0.0.0.0 --port $PORT
web: bundle exec thin start -R config.ru -e $RACK_ENV -p $PORT
#worker: bundle exec ruby hi.rb
#web: bundle exec puma -C config/puma.rb
