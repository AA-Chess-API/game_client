require "minitest/autorun"

require "game_client"
require "webmock/minitest"
require 'minitest/reporters'

Minitest::Reporters.use!

def body
  <<-BODY
    [
        {
            "id": 1,
            "name": "epic game",
            "initiator_id": "Li",
            "challenger_id": "Ladson",
            "game_log": null,
            "created_at": "2015-09-20T00:15:20.275Z",
            "updated_at": "2015-09-20T00:15:20.275Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 2,
            "name": "yet another game",
            "initiator_id": "John Wich",
            "challenger_id": "Superman",
            "game_log": null,
            "created_at": "2015-09-20T00:15:20.281Z",
            "updated_at": "2015-09-20T00:15:20.281Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 3,
            "name": "epic game",
            "initiator_id": "Batman",
            "challenger_id": "Kyo",
            "game_log": null,
            "created_at": "2015-09-20T00:15:20.282Z",
            "updated_at": "2015-09-20T00:15:20.282Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 4,
            "name": "epic game",
            "initiator_id": "Goku",
            "challenger_id": "Trump",
            "game_log": null,
            "created_at": "2015-09-20T00:15:20.284Z",
            "updated_at": "2015-09-20T00:15:20.284Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 5,
            "name": "epic game",
            "initiator_id": "Ned",
            "challenger_id": "Kush",
            "game_log": null,
            "created_at": "2015-09-20T00:15:20.286Z",
            "updated_at": "2015-09-20T00:15:20.286Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 6,
            "name": "jacky vs ...",
            "initiator_id": "jacky",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T00:20:13.372Z",
            "updated_at": "2015-09-20T00:20:13.372Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 7,
            "name": "jacky vs ...",
            "initiator_id": "jacky",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T00:22:55.709Z",
            "updated_at": "2015-09-20T00:22:55.709Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 8,
            "name": "jacky vs ...",
            "initiator_id": "jacky",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T00:35:21.606Z",
            "updated_at": "2015-09-20T00:35:21.606Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 9,
            "name": "jacky vs ...",
            "initiator_id": "jacky",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T00:36:28.005Z",
            "updated_at": "2015-09-20T00:36:28.005Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 10,
            "name": "jacky vs ",
            "initiator_id": "jacky",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T00:37:10.842Z",
            "updated_at": "2015-09-20T00:37:10.842Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 11,
            "name": "jacky",
            "initiator_id": "jacky",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T00:37:16.470Z",
            "updated_at": "2015-09-20T00:37:16.470Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 12,
            "name": "jacky",
            "initiator_id": "jacky",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T00:38:21.778Z",
            "updated_at": "2015-09-20T00:38:21.778Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 13,
            "name": "jacky",
            "initiator_id": "jacky",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T00:39:03.261Z",
            "updated_at": "2015-09-20T00:39:03.261Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 14,
            "name": "jacky",
            "initiator_id": "jacky",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T00:39:14.824Z",
            "updated_at": "2015-09-20T00:39:14.824Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 15,
            "name": "jacky",
            "initiator_id": "jacky",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T00:39:32.046Z",
            "updated_at": "2015-09-20T00:39:32.046Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 16,
            "name": "jacky",
            "initiator_id": "jacky",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T00:40:59.455Z",
            "updated_at": "2015-09-20T00:40:59.455Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 17,
            "name": "jacky",
            "initiator_id": "jacky",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T00:41:47.630Z",
            "updated_at": "2015-09-20T00:41:47.630Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 18,
            "name": "jacky",
            "initiator_id": "jacky",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T00:44:08.111Z",
            "updated_at": "2015-09-20T00:44:08.111Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 19,
            "name": "jacky",
            "initiator_id": "jacky",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T01:15:41.539Z",
            "updated_at": "2015-09-20T01:15:41.539Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 20,
            "name": "edmund gamae'",
            "initiator_id": "ed li",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T01:19:48.554Z",
            "updated_at": "2015-09-20T01:19:48.554Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 21,
            "name": "fndaslkj",
            "initiator_id": "ej;lw",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T01:20:28.568Z",
            "updated_at": "2015-09-20T01:20:28.568Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        },
        {
            "id": 22,
            "name": "fldka",
            "initiator_id": "fdjlkas",
            "challenger_id": null,
            "game_log": null,
            "created_at": "2015-09-20T01:20:42.459Z",
            "updated_at": "2015-09-20T01:20:42.459Z",
            "state": "WAITING",
            "last_move": null,
            "last_player": null
        }
    ]
  BODY
end