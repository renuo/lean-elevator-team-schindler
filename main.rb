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
  target_level = params_json['elevator']['target_floors'].first || first_floor_with_people(params_json['floors'])

  target_level.to_json
end

def first_floor_with_people(floors)
  floors.find_index do |floor|
    floor['panel']['up'] || floor['panel']['down']
  end
end
