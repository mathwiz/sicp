%%%-------------------------------------------------------------------
%%% @author Yohan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. Jul 2018 2:36 PM
%%%-------------------------------------------------------------------
-module(ex107).
-author("Yohan").

%% API
-export([sqrt/1]).


square(X) -> X * X.

average(X, Y) -> (X + Y) / 2.0.

improve(Guess, X) -> average(Guess, X / Guess).

good_enough(Guess, X) -> abs(square(Guess) - X) < (Guess / 100000.0).

sqrt_iter(Guess, X) ->
  case good_enough(Guess, X) of
    true -> Guess;
    false -> sqrt_iter(improve(Guess, X), X)
  end.

sqrt(X) -> sqrt_iter(1.0, X).
