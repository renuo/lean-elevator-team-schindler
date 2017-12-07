# frozen_string_literal: true

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
  # target_level = if params_json['elevator']['capacity'] == 6
  #                  params_json['elevator']['target_floors'].first
  #                else
  #                  (0..14).to_a.sample
  #                end
  target_level = (0..14).to_a.sample

  target_level.to_json
end
