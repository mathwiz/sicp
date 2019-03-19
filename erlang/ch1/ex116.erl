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
-module(ex116).
-author("Yohan").

%% API
-export([main/0, expt_inv/2]).

main() ->
  io:fwrite("~w\n", [expt_inv(2, 0)]),
  io:fwrite("~w\n", [expt_inv(2, 4)]),
  io:fwrite("~w\n", [expt_inv(2, 9)]),
  io:fwrite("~w\n", [expt_inv(3, 4)]),
  io:fwrite("~w\n", [expt_inv(3, 5)]).


sq(X) -> X * X.

expt_invariant(_, 0, A) -> A;
expt_invariant(B, P, A) when (P rem 2 == 0) -> expt_invariant(sq(B), P div 2, A);
expt_invariant(B, P, A) -> expt_invariant(B, P-1, A*B).

expt_inv(B, P) -> expt_invariant(B, P, 1).
