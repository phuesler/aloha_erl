-module(aloha_utils_test).
-compile(export_all).

% Include etest's assertion macros.
-include_lib("etest/include/etest.hrl").

test_hello() ->
    ?assert_equal("kekahi mau pipi", aloha_utils:hello()).
