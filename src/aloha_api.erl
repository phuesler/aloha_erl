-module(aloha_api).
-export([handle/2, handle_event/3]).

-include_lib("elli/include/elli.hrl").
-behaviour(elli_handler).


%%
%% ELLI REQUEST CALLBACK
%%
handle(Req, _Args) ->
    %% Delegate to our handler function
    handle(Req#req.method, elli_request:path(Req), Req).

%% Route METHOD & PATH to the appropriate clause
handle('GET',[<<"aloha">>], _Req) ->
    {ok, [], <<"kekahi mau pipi">>};

handle('GET',[<<"log">>], _Req) ->
    lager:debug("aloha"),
    lager:warning("freak set"),
    lager:error("wipe out"),
    {ok, [], <<"log">>};

handle(_, _, _Req) ->
    {404, [], <<"wipe out!">>}.

%%
%% ELLI EVENT CALLBACKS
%%

%% @doc: Handle request events, like request completed, exception
%% thrown, client timeout, etc. Must return 'ok'.
handle_event(_Event, _Data, _Args) ->
    ok.
