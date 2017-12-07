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
  target_level = floor_decision(params_json)
  target_level.to_json
end

def floor_decision(params_json)
  target_floors = params_json['elevator']['target_floors']
  target_floors.empty? ? first_floor_with_people(params_json['floors']) : floor_most_people_want_to_leave(target_floors)
end

def floor_most_people_want_to_leave(target_floors)
  target_floors.inject(Hash.new(0)) {|h, i| h[i] += 1; h}.sort {|a1, a2| a2[1]<=>a1[1]}.first.first
end

def first_floor_with_people(floors)
  floors.find_index do |floor|
    floor['panel']['up'] || floor['panel']['down']
  end
end
