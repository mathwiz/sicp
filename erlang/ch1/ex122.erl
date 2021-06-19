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
-module(ex122).
-author("Yohan").

%% API
-export([main/0]).

main() ->
  io:fwrite("~w\n", [search_for_primes(1000, 1020)]),
  io:fwrite("~w\n", [search_for_primes(10000, 10040)]),
  io:fwrite("~w\n", [search_for_primes(100000, 100080)]).


smallest_divisor(N) -> find_divisor(N, 2).

find_divisor(N, Test) when Test * Test > N -> N;
find_divisor(N, Test) ->
  if
    N rem Test == 0 -> Test;
    true -> find_divisor(N, Test + 1)
  end.

prime(N) -> N == smallest_divisor(N).

report_prime(N, Prime) ->
  if
    Prime -> io:fwrite("~w ***\n", [N]);
    true -> io:fwrite("~w \n", [N])
  end.

prime_test(N) -> report_prime(N, prime(N)).

search_helper(N, End) ->
  if
    N =< End -> prime_test(N), search_helper(N + 2, End);
    true -> io:fwrite("finished\n")
  end.

search_for_primes(Start, End) ->
  if
    Start rem 2 == 1 -> search_helper(Start, End);
    true-> search_helper(Start + 1, End)
  end.
