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
    elli:start_link([{callback, aloha_api}, {port, 3000}]),
    aloha_sup:start_link().

stop(_State) ->
    ok.
