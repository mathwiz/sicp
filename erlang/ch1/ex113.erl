%%%-------------------------------------------------------------------
%%% @author Yohan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% cd("c:/Users/Yohan/IdeaProjects/sicp/erlang/ch1").
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
  io:fwrite("~w\n", [fib(7)]),
  io:fwrite("~w\n", [fib_formula(0)]),
  io:fwrite("~w\n", [fib_formula(1)]),
  io:fwrite("~w\n", [fib_formula(2)]),
  io:fwrite("~w\n", [fib_formula(3)]),
  io:fwrite("~w\n", [fib_formula(4)]),
  io:fwrite("~w\n", [fib_formula(5)]),
  io:fwrite("~w\n", [fib_formula(15)]).


fib(1) -> 1;
fib(2) -> 1;
fib(N) -> fib(N - 1) + fib(N - 2).


psi() -> (1 + math:sqrt(5)) / 2.

phi() -> (1 - math:sqrt(5)) / 2.


fib_formula(0) -> 0;
fib_formula(1) -> 1;
fib_formula(N) -> round((math:pow(psi(), N) - math:pow(phi(), N)) / math:sqrt(5)).
