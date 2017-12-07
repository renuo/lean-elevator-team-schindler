require File.expand_path '../spec_helper.rb', __FILE__


def response
  {
    "elevator": {
      "capacity": 6,
      "current_floor": 8,
      "target_floors": [],
      "statistics": 15273
    },
    "floors": [{
                 "panel": {
                   "up": false,
                   "down": false
                 }
               }, {
                 "panel": {
                   "up": false,
                   "down": false
                 }
               }, {
                 "panel": {
                   "up": true,
                   "down": false
                 }
               }, {
                 "panel": {
                   "up": true,
                   "down": true
                 }
               }, {
                 "panel": {
                   "up": false,
                   "down": false
                 }
               }, {
                 "panel": {
                   "up": true,
                   "down": false
                 }
               }, {
                 "panel": {
                   "up": false,
                   "down": false
                 }
               }, {
                 "panel": {
                   "up": true,
                   "down": false
                 }
               }, {
                 "panel": {
                   "up": false,
                   "down": false
                 }
               }, {
                 "panel": {
                   "up": false,
                   "down": true
                 }
               }, {
                 "panel": {
                   "up": false,
                   "down": true
                 }
               }, {
                 "panel": {
                   "up": false,
                   "down": true
                 }
               }, {
                 "panel": {
                   "up": false,
                   "down": true
                 }
               }, {
                 "panel": {
                   "up": false,
                   "down": false
                 }
               }, {
                 "panel": {
                   "up": false,
                   "down": false
                 }
               }]
  }
end


describe 'The simple main app' do
  it 'allows access to the home page' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'allows to access the decider' do
    post '/decide', response.to_json
    expect(last_response).to be_ok
    expect(last_response.body).to eq('')

  end
end