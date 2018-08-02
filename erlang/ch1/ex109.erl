%%%-------------------------------------------------------------------
%%% @author Yohan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Aug 2018 5:10 PM
%%%-------------------------------------------------------------------
-module(ex109).
-author("Yohan").

%% API
-export([plus_r/2, plus_it/2]).


inc(X) -> X + 1.

dec(X) -> X - 1.

plus_r(0, B) -> B;
plus_r(A, B) -> inc(plus_r(dec(A), B)).

plus_it(0, B) -> B;
plus_it(A, B) -> plus_it(dec(A), inc(B)).
