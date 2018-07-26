%%%-------------------------------------------------------------------
%%% @author Yohan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% compile with > c("ex103.erl").
%%% load with > l(ex103).
%%% run with > ex103:main().
%%% @end
%%% Created : 25. Jul 2018 1:55 PM
%%%-------------------------------------------------------------------
-module(ex103).
-author("Yohan").

%% API
-export([main/0,larger_sq/3]).

main() ->
  io:fwrite("~w\n",[larger_sq(1,1,1)]),
  io:fwrite("~w\n",[larger_sq(1,1,2)]),
  io:fwrite("~w\n",[larger_sq(1,2,3)]),
  io:fwrite("~w\n",[larger_sq(5,4,3)]),
  io:fwrite("~w\n",[larger_sq(2,2,2)]),
  io:fwrite("~w\n",[larger_sq(3,3,3)]),
  io:fwrite("~w\n",[larger_sq(4,2,3)]).

larger_sq(X, Y, Z) when (X =< Y) and (X =< Z) -> Y * Y + Z * Z;
larger_sq(X, Y, Z) when (Y =< X) and (Y =< Z) -> X * X + Z * Z;
larger_sq(X, Y, Z) when (Z =< Y) and (Z =< X) -> Y * Y + X * X.