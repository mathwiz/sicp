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
-module(ex114).
-author("Yohan").

%% API
-export([main/0]).

main() ->
  io:fwrite("~w\n", [count_change(1)]),
  io:fwrite("~w\n", [count_change(2)]),
  io:fwrite("~w\n", [count_change(3)]),
  io:fwrite("~w\n", [count_change(11)]),
  io:fwrite("~w\n", [count_change(100)]).


biggest_denom(1) -> 1;
biggest_denom(2) -> 5;
biggest_denom(3) -> 10;
biggest_denom(4) -> 25;
biggest_denom(5) -> 50.


cc(0, _) -> 1;
cc(_, 0) -> 0;
cc(Amount, _) when Amount < 0 -> 0;
cc(Amount, KindsOfCoins) ->
  cc(Amount, KindsOfCoins - 1) + cc(Amount - biggest_denom(KindsOfCoins), KindsOfCoins).


count_change(Amount) -> cc(Amount, 5).

%% count_change(100) == 292
