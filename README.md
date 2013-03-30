# Aloha Ruby Conference demo application

Hopefully, when it's grown up, this will be an Erlang web app starter kit.

## Steps to create a new erlang app

    $: rebar create-app appid=aloha
    $: mkdir log
    $: touch log/.gitkeep
    $: curl -O https://raw.github.com/phuesler/aloha_erl/master/rebar.config
    $: curl -O https://raw.github.com/phuesler/aloha_erl/master/Guardfile
    $: curl -O https://raw.github.com/phuesler/aloha_erl/master/.gitignore
    $: rebar get-deps
    $: rebar compile
    $: erl -pa deps/*/ebin ebin
