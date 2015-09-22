require_relative "./game_client/version"
require_relative "./base"


module GameClient

	def game_list
		url = url("games")
		JSON.parse(RestClient.get(url))
	end

	def create_game(game_name:, player_name:)
		# post /games

		# game_name = prompt_enter_game_name
		# player_name = prompt_enter_player_name

		url = url("games")

		response = RestClient.post(
			url,
			{ game_name: game_name, player_name: player_name }
		)

		# -> {"game_name"=>"game_name", 
		#     "initiator_id"=>"player_name", 
		#     "url"=>"http://localhost:3000/games/:id?player=player_name"}
		# debugger
		JSON.parse(response)
	end

	def join_game(game_name:, player_name:)
		# patch request
		# patch id shown on list (not game id in db)
		url = url("join")
		response = RestClient.patch(
			url,
			{ game_name: game_name, player_name: player_name }
		)

		# return http://localhost:3000/games/2?player=ed
		response
	end

	def get_update(id:, player_name:)
		# get request to server every 2 secs and upate game state
		# loop, break until updated
		# localhost:3000/games/30?player=ed

		url = url("games/#{id}?player=#{player_name}")

		state = "WAIT"
		while state == "WAIT"
			response = JSON.parse(RestClient.get(url))
			state = response["state"]
			sleep(1)
		end

		JSON.parse(response["move"])
	end

	def make_move(id:, player_name:, move:)
		# patch request
		url = url("games/#{id}")
		response = RestClient.patch(
			url,
			{ player: player_name, move: move }
		)

		fail "Not your turn." if response == "404"
	end

	def exit_game!(game_name:, player_name:)
		# patch request
		url = url("quit")
		response = RestClient.patch(
			url,
			{ game_name: game_name, player_name: player_name }
		)

		response
	end

	# parse raw json to hash
	def parse_response
		
	end


	private
	# TODO: wrapper client, refactor this into .env
	def url(uri)
		url = Addressable::URI.new(
		  scheme: "http",
		  host: "localhost",
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