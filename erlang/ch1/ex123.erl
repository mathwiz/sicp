%%%-------------------------------------------------------------------
%%% @author Yohan Lee
%%% @copyright (C) 2019
%%% @doc
%%% cd("c:/Users/Yohan/IdeaProjects/sicp/erlang/ch1").
%%% compile with > c("exXXX.erl").
%%% if already compiled, load with > l(exXXX).
%%% run with > exXXX:main().
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(ex123).
-author("Yohan").

%% API
-export([main/0, smallest_divisor/1]).

main() ->
  io:fwrite("~w\n", [smallest_divisor(199)]),
  io:fwrite("~w\n", [smallest_divisor(1999)]),
  io:fwrite("~w\n", [smallest_divisor(19999)]),
  io:fwrite("~w\n", [smallest_divisor(15)]).


smallest_divisor(N) -> find_divisor(N, 2).

find_divisor(N, Test) when Test * Test > N -> N;
find_divisor(N, Test) ->
  if
    N rem Test == 0 -> Test;
    true -> find_divisor(N, Test + 1)
  end.

next(2) -> 3;
next(N) -> N + 2.
