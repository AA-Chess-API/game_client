require 'byebug'
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

  # def test_create_game
  # 	stub_request(:post, url('games')).
  # 		with(body: { game_name: "epic game", player_name: "edmund" }).
  # 		to_return(body: <<-BODY
  # 			{ "game_name"=>"epic game",
  # 				"initiator_id"=>"edmund", 
  # 				"url"=>"http://localhost:3000/games/22?player=edmund" }
  # 				BODY
  # 				)

  # 	game_name_input = StringIO.new("epic game\n")
  # 	play_name_input = StringIO.new("edmund\n")
  # 	# debugger
  # 	response = create_game

  # 	assert_requested(:post, url('games'))

  # 	hash = {"game_name"=>"game_name", "initiator_id"=>"player_name", "url"=>"http://localhost:3000/games/22?player=edmund"}
  # 	assert_equal response.split("\n").map(&:strip).to_h, hash
  # end
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