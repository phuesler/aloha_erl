-module (aloha_api_test).
-compile (export_all).

% etest macros
-include_lib ("etest/include/etest.hrl").
% etest_http macros
-include_lib ("etest_http/include/etest_http.hrl").

before_suite() ->
    application:start(aloha).

before_test() -> ok.

after_test() -> ok.

after_suite() ->
    application:stop(aloha).

test_aloha() ->
    Response = ?perform_get("http://localhost:3000/aloha"),
    ?assert_status(200, Response),
    ?assert_body("kekahi mau pipi", Response).
