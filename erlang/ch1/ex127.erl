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
-module(ex127).
-author("Yohan").

%% API
-export([main/0]).

main() ->
  io:fwrite("~w\n", [test_number(10)]),
  io:fwrite("~w\n", [test_number(11)]),
  io:fwrite("~w\n", [test_number(561)]),
  io:fwrite("~w\n", [test_number(1105)]),
  io:fwrite("~w\n", [test_number(1729)]),
  io:fwrite("~w\n", [test_number(2465)]),
  io:fwrite("~w\n", [test_number(2821)]),
  io:fwrite("~w\n", [test_number(6601)]),
  io:fwrite("~w\n", [test_number(6603)]).

test_number(N) ->
  io:format("n:~w \tPrime:~w \tFast Prime:~w \tCarmichael:~w\t", [N, prime(N), fast_prime(N, 20), carmichael(N)]).

square(N) -> N * N.

random(Limit) -> rand:uniform(Limit) - 1.

even(N) -> N rem 2 == 0.

smallest_divisor(N) -> find_divisor(N, 2).

find_divisor(N, Test) when Test * Test > N -> N;
find_divisor(N, Test) ->
  if
    N rem Test == 0 -> Test;
    true -> find_divisor(N, Test + 1)
  end.

prime(N) -> N == smallest_divisor(N).

expmod(_, 0, _) -> 1;
expmod(Base, Exp, M) ->
  case even(Exp) of
    true -> square(expmod(Base, Exp div 2, M)) rem M;
    false -> Base * expmod(Base, Exp - 1, M) rem M
  end.

fermat_test(N) ->
  TryIt = fun (A) -> expmod(A, N, N) == A end,
  TryIt(1 + random(N - 1)).

fast_prime(_, 0) -> true;
fast_prime(N, Times) ->
  case fermat_test(N) of
    true -> fast_prime(N, Times-1);
    false -> false
  end.

carmichael(N) ->
  TryIt = fun (A) -> expmod(A, N, N) == A end,
  not prime(N) and do_carmichael(TryIt, N-1). 

do_carmichael(TestFn, X) ->
  X==0 or TestFn(X) and do_carmichael(X-1).
