%%%-------------------------------------------------------------------
%%% @author Yohan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% load with > c("ex102.erl").
%%% run with > ex102:fraction().
%%% @end
%%% Created : 12. Jul 2018 5:00 PM
%%%-------------------------------------------------------------------
-module(ex102).
-author("Yohan").

%% API
-export([fraction/0]).

fraction() ->
  io:fwrite("~w\n", [(5 + 4 + (2 - (3 - (6 + 4 / 5)))) / (3 * (6 - 2) * (2 - 7))]).
