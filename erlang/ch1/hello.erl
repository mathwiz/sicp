%%%-------------------------------------------------------------------
%%% @author Yohan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% load with > c("hello.erl").
%%% @end
%%% Created : 12. Jul 2018 1:47 PM
%%%-------------------------------------------------------------------
-module(hello).
-author("Yohan").

%% API
-export([hello_world/0]).

hello_world() -> io:fwrite("hello, world!\n").
