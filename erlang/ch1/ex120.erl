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
-module(ex120).
-author("Yohan").

%% API
-export([main/0, gcd/2]).

main() ->
  io:fwrite("~w\n", [gcd(206, 40)]),
  io:fwrite("~w\n", [gcd(60, 45)]),
  io:fwrite("~w\n", [gcd(24, 12)]),
  io:fwrite("~w\n", [gcd(1, 1)]).


gcd(A, 0) -> A;
gcd(A, B) -> gcd(B, A rem B).

