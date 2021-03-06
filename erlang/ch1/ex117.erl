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
-module(ex117).
-author("Yohan").

%% API
-export([main/0, times/2]).

main() ->
  io:fwrite("~w\n", [times(2, 0)]),
  io:fwrite("~w\n", [times(2, 4)]),
  io:fwrite("~w\n", [times(2, 9)]),
  io:fwrite("~w\n", [times(3, 4)]),
  io:fwrite("~w\n", [times(3, 5)]).


double(X) -> X * 2.

halve(X) -> X div 2.

mult_invariant(_, 0) -> 0;
mult_invariant(A, B) when (B rem 2 == 0) -> double(mult_invariant(halve(B), A));
mult_invariant(A, B) -> A + mult_invariant(A, B-1).

times(A, B) -> mult_invariant(A, B).
