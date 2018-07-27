%%%-------------------------------------------------------------------
%%% @author Yohan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. Jul 2018 2:36 PM
%%%-------------------------------------------------------------------
-module(ex106).
-author("Yohan").

%% API
-export([sqrt/1, bad_sqrt/1, new_if/3]).


square(X) -> X * X.

average(X, Y) -> (X + Y) / 2.0.

improve(Guess, X) -> average(Guess, X / Guess).

good_enough(Guess, X) -> abs(square(Guess) - X) < 0.001.

sqrt_iter(Guess, X) ->
  case good_enough(Guess, X) of
    true -> Guess;
    false -> sqrt_iter(improve(Guess, X), X)
  end.

sqrt(X) -> sqrt_iter(1.0, X).

bad_sqrt_iter(Guess, X) -> new_if(good_enough(Guess, X), Guess, bad_sqrt_iter(improve(Guess, X), X)).

%%% This will hang Erlang
bad_sqrt(X) -> bad_sqrt_iter(1.0, X).

new_if(true, Then_clause, _) -> Then_clause;
new_if(false, _, Else_clause) -> Else_clause.
