%%%-------------------------------------------------------------------
%%% @author Yohan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% compile with > c("ex108.erl").
%%% load with > l(ex108).
%%% run with > ex108:cbrt(x).
%%% @end
%%% Created : 27. Jul 2018 2:36 PM
%%%-------------------------------------------------------------------
-module(ex108).
-author("Yohan").

%% API
-export([cbrt/1]).


square(X) -> X * X.

cube(X) -> X * X * X.

improve(Guess, X) -> (X / square(Guess) + 2 * Guess) / 3.0.

good_enough(Guess, X) -> abs(cube(Guess) - X) < (Guess / 100000.0).

cbrt_iter(Guess, X) ->
  case good_enough(Guess, X) of
    true -> Guess;
    false -> cbrt_iter(improve(Guess, X), X)
  end.

cbrt(X) -> cbrt_iter(1.0, X).
