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

mult_invariant(_, 0, A) -> A;
mult_invariant(B, P, A) when (P rem 2 == 0) -> mult_invariant(double(B), halve(P), A);
mult_invariant(B, P, A) -> mult_invariant(B, P - 1, A + B).

times(A, B) -> mult_invariant(A, B, 0).
