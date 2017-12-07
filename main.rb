require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'

get '/' do
  'This is a sample elevator'
end

post '/decide' do
  content_type :json
  params_json = JSON.parse(request.body.read)

  # Do the calculations
  puts "Got: \n#{params_json}"
  target_level = [0..14].sample

  target_level.to_json
end
