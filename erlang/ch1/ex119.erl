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
-module(ex119).
-author("Yohan").

%% API
-export([main/0, fib/1]).

main() ->
  io:fwrite("~w\n", [fib(0)]),
  io:fwrite("~w\n", [fib(1)]),
  io:fwrite("~w\n", [fib(2)]),
  io:fwrite("~w\n", [fib(3)]),
  io:fwrite("~w\n", [fib(4)]),
  io:fwrite("~w\n", [fib(5)]),
  io:fwrite("~w\n", [fib(6)]),
  io:fwrite("~w\n", [fib(15)]).


sq(X) -> X * X.

halve(X) -> X div 2.

fib_iter(_, B, _, _, 0) -> B;
fib_iter(A, B, P, Q, Count) when (Count rem 2 == 0) -> fib_iter(A, B, sq(P) + sq(Q), sq(Q) + (2*P*Q), halve(Count));
fib_iter(A, B, P, Q, Count) -> fib_iter(B*Q + A*Q + A*P, B*P + A*Q, P, Q, Count - 1).

fib(N) -> fib_iter(1, 0, 0, 1, N).
