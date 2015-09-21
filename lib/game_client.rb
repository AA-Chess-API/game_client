# require "game_client/version"

require 'dotenv'
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

		game_name = prompt_enter_game_name
		player_name = prompt_enter_player_name

		url = url('games')

		response = RestClient.post(
			url,
			{ game_name: game_name, player_name: player_name }
		)

		# -> {"game_name"=>"game_name", 
		#     "initiator_id"=>"player_name", 
		#     "url"=>"http://localhost:3000/games/:id?player=player_name"}
		JSON.parse(response) 
	end

	def join_game(id)
		# patch request
		# patch id shown on list (not game id in db)
	end

	def get_update
		# get request to server every 2 secs and upate game state
		# loop, break until updated
	end

	def make_move
		# patch request
	end

	def exit_game!
		# patch request
	end

	# parse raw json to hash
	def parse_response
		
	end


	private

	def url(uri)
		url = Addressable::URI.new(
		  scheme: 'http',
		  host: 'localhost',
		  port: 3000,
		  path: "/#{uri}"
		).to_s
	end

	def prompt_enter_game_name
		puts "=" * 20 + "Create Game" + "=" * 20
		print "Please enter game name: "
		gets.chomp
	end

	def prompt_enter_player_name
		print "Please enter your name: "
		gets.chomp
	end

end