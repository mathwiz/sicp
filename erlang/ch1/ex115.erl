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
-module(ex115).
-author("Yohan").

%% API
-export([main/0]).

main() ->
  io:fwrite("~w\n", [sine(1)]),
  io:fwrite("~w\n", [sine(2)]),
  io:fwrite("~w\n", [sine(100)]).


cube(X) -> X * X * X.


sine(Angle) when abs(Angle) < 0.1 -> Angle;
sine(Angle) -> p(sine(Angle / 3.0)).


p(X) -> 3 * X - 4 * cube(X).

