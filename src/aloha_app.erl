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
    ok = dev_start(lager),
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

dev_start(App) -> dev_start(App, temporary).

dev_start(App, Type) ->
    case application:start(App, Type) of
        {error, {not_started, DepApp}} ->
            dev_start(DepApp),
            dev_start(App, Type);
        ok -> ok;
        {error, {already_started, App}} -> ok
    end.
