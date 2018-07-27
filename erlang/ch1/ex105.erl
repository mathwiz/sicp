%%%-------------------------------------------------------------------
%%% @author Yohan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. Jul 2018 1:16 PM
%%%-------------------------------------------------------------------
-module(ex105).
-author("Yohan").

%% API
-export([test/2, p/0]).

p() -> p().

%%% try this> test(0, p). Does not do infinite recursion.
test(X, Y) ->
  if X == 0 -> 0;
    true -> Y
  end.
