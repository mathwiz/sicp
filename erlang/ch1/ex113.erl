%%%-------------------------------------------------------------------
%%% @author Yohan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% compile with > c("exXXX.erl").
%%% load with
%%% > cd("c").
%%% > l(exXXX).
%%% run with > exXXX:main().
%%%
%%% @end
%%% Created : 19. Aug 2018 3:36 PM
%%%-------------------------------------------------------------------
-module(ex113).
-author("Yohan").

%% API
-export([main/0]).

main() ->
  io:fwrite("~w\n", [fib(1)]),
  io:fwrite("~w\n", [fib(2)]),
  io:fwrite("~w\n", [fib(3)]),
  io:fwrite("~w\n", [fib(4)]),
  io:fwrite("~w\n", [fib(5)]),
  io:fwrite("~w\n", [fib(6)]),
  io:fwrite("~w\n", [fib(7)]).


fib(1) -> 1;
fib(2) -> 1;
fib(N) -> fib(N - 1) + fib(N - 2).
