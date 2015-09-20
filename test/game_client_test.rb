require 'byebug'
require_relative "./test_helper"

class GameClientTest < Minitest::Test

  def test_get_game_list
  	stub_request(:get, 'localhost:3000/games').to_return(body: body)
    RestClient.get('localhost:3000/games')
    assert_requested(:get, 'localhost:3000/games')
  end
end


# stub_request(:get, 'http://host/api').with(:body => { :name => 'value' }).to_return(:body => 'fake body')

# stub_request(:get, 'http://host/api?name=value').to_return(:body => 'fake body')
# stub_request(:get, 'http://host/api').with(:query => { :name => 'value' }).to_return(:body => 'fake body') # alternate way to write the above


# stub_request(:get, 'http://host/api').with(:query => { :key => 'value' }).to_return(:body => 'fake body')
# RestClient.get('http://host/api?key=value') 
# RestClient.get('http://host/api', :params => { :key => 'value' }) # alternate way to write the above
# WebMock.should have_requested(:get ,'http://host/api?key=value')
# WebMock.should have_requested(:get ,'http://host/api').with(:query => { :key => 'value' }) # alternate way to write the above


# stub_request(:post, 'http://host/api').with(:body => { :key => 'value' }).to_return(:body => 'fake body')
# RestClient.post('http://host/api', :key => 'value') 
# WebMock.should have_requested(:post ,'http://host/api')