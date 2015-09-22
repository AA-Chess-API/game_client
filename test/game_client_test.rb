require_relative "./test_helper"

class GameClientTest < Minitest::Test
	include GameClient

	def url(uri)
		url = "localhost:3000/#{uri}"
	end

  def test_get_game_list
  	stub_request(:get, url('games')).to_return(body: body)
    response = game_list

    assert_requested(:get, url('games'))
    assert_kind_of Array, response
    assert response.all? { |el| el.is_a?(Hash) }
    assert_equal body.split("\n").map(&:strip).join.delete(' '), response.to_json.delete(' ')
  end

  def test_create_game
    resp_body = <<-BODY
        {"game_name":"epic game",
          "initiator_id":"John Wick", 
          "url":"http://localhost:3000/games/22?player=John+Wick"}
      BODY

    resp_body = resp_body.split("\n").map(&:strip).join

  	stub_request(:post, url('games')).
  		with(:body => {"game_name"=>"epic game", "player_name"=>"John Wick"},
               :headers => { 'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'Content-Length'=>'45', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Ruby' }).
  		to_return(body: resp_body)
  	
  	response = create_game(game_name: 'epic game', player_name: 'John Wick')

  	assert_requested(:post, url('games'))
  	assert_equal response, JSON.parse(resp_body)
  end

  def test_join_game
    # stub_request(:patch, url("games/15?player=ed"))
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








