require File.expand_path '../spec_helper.rb', __FILE__

describe 'The simple main app' do
  it 'allows access to the home page' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'allows to access the decider' do
    post '/decide', {state: 'blub'}.to_json
    expect(last_response).to be_ok
  end
end