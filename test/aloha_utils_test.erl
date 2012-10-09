-module(aloha_utils_test).
-compile(export_all).

% Include etest's assertion macros.
-include_lib("etest/include/etest.hrl").

before_suite() ->
    %start up applications
    ok.

before_test() ->
    %load fixtures
    ok.

test_hello() ->
    ?assert_equal("kekahi mau pipi", aloha_utils:hello()).

after_test() ->
    % tear down fixtures
    ok.

after_suite() ->
    % stop applications
    ok.
