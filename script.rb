require 'addressable/uri'
require 'rest-client'
require 'json'

module GameClient

	def game_list
		url = url('games')
		JSON.parse(RestClient.get(url))
	end

	def create_game
		# enter name
		# post request
		# paht: /games

		puts "=" * 20 + "Create Game" + "=" * 20
		print "Please enter game name: "
		game_name = gets.chomp

		print "Please enter your name: "
		player_name = gets.chomp

		url = url('games')
		response = RestClient.post(
			url,
			{ game_name: game_name, player_name: player_name }
		)

		JSON.parse(response) 
		# -> {"game_name"=>"game_name", "initiator_id"=>"player_name", "url"=>"http://localhost:3000/games/22?player=fdjlkas"}
	end

	def enter_game(id)
		# post request
		# post id shown on list (not game id in db)
	end

	def update_game_state
		# get request to server every 2 secs and upate game state
		# loop, break until updated
	end

	def exit_game!
		
	end

	# parse raw json to hash
	def parse_response
		
	end

	def url(path)
		url = Addressable::URI.new(
		  scheme: 'http',
		  host: 'localhost',
		  port: 3000,
		  path: "/#{path}"
		).to_s
	end

end