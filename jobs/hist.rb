get '/fi' do
  #File.read(File.join('public', 'index.html'))
  settings.history.to_yaml
end
