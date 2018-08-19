%%%-------------------------------------------------------------------
%%% @author Yohan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% compile with > c("exXXX.erl").
%%% load with
%%% > cd("c").
%%% > l(exXXX).
%%% run with > exXXX:main().
%%% %%% @end
%%% Created : 19. Aug 2018 12:30 PM
%%%-------------------------------------------------------------------
-module(ex112).
-author("Yohan").

%% API
-export([main/0, pascal/2]).

main() ->
  io:fwrite("~w\n", [pascal(6, 1)]),
  io:fwrite("~w\n", [pascal(6, 2)]),
  io:fwrite("~w\n", [pascal(6, 3)]),
  io:fwrite("~w\n", [pascal(6, 4)]),
  io:fwrite("~w\n", [pascal(6, 5)]),
  io:fwrite("~w\n", [pascal(6, 6)]).

pascal(_, 1) -> 1;
pascal(R, N) when N == R -> 1;
pascal(R, N) -> pascal(R - 1, N - 1) + pascal(R - 1, N).
