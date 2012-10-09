-module(aloha_app).

-behaviour(application).

%% Application callbacks
-export([start/0, start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start() ->
    application:start(aloha, permanent).

start(_StartType, _StartArgs) ->
    ok = application:start(compiler),
    ok = application:start(syntax_tools),
    ok = application:start(lager),
    reloader:start(),
    {ok, DefaultPort} = application:get_env(aloha, worker_port),
    Port = get_port(DefaultPort),
    elli:start_link([{callback, aloha_api}, {port, Port}]),
    aloha_sup:start_link().

stop(_State) ->
    ok.


get_port(Default) ->
    Key = "PORT",
    case os:getenv(Key) of
        false -> Default;
        Val -> list_to_integer(Val)
    end.
