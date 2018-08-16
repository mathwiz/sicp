%%%-------------------------------------------------------------------
%%% @author Yohan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% compile with > c("ex111.erl").
%%% load with
%%% > cd("c").
%%% > l(ex111).
%%% run with > ex111:main().
%%% @end
%%% Created : 16. Aug 2018 2:42 PM
%%%-------------------------------------------------------------------
-module(ex111).
-author("Yohan").

%% API
-export([main/0, recursive/1, iterative/1]).

main() ->
  io:fwrite("~w\n",[recursive(1)]),
  io:fwrite("~w\n",[recursive(4)]),
  io:fwrite("~w\n",[recursive(8)]),
  io:fwrite("~w\n",[iterative(1)]),
  io:fwrite("~w\n",[iterative(4)]),
  io:fwrite("~w\n",[iterative(8)]).

recursive(N) when N < 3 -> N;
recursive(N) -> recursive(N-1) + 2 * recursive(N-2) + 3 * recursive(N-3).

iterative(N) when N < 3 -> N;
iterative(N) -> helper(2, 1, 0, N).

helper(A, B, C, 3) -> single(A, B, C);
helper(A, B, C, N) -> helper(single(A, B, C), A, B, N-1).

single(A, B, C) -> A + 2 * B + 3 * C.
