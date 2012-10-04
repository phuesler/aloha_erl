# Aloha Ruby Conference demo application

Hopefully, when it's grown up, this will be an Erlang web app starter kit.

# Steps

    $ rebar create-app srvid=aloha
    $ cp templates/rebar.config.template rebar.config
    $ rebar get-deps compile
	$ cp templates/aloha_api.erl aloha_api.erl
	$ cp templates/aloha_app.erl aloah_app.erl
	$ rebar compile
	$ erl -pa deps/*/ebin ebin -s aloha_app
	$ curl localhost:3000/aloha
