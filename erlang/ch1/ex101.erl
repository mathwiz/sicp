%%% load with > c("ex101.erl").
%%% run with > ex101:expressions().

-module(ex101).
-author("Yohan").

%% API
-export([expressions/0]).

expressions() ->
  io:fwrite("~w\n",[10]),
  io:fwrite("~w\n",[5 + 3 + 4]),
  io:fwrite("~w\n",[9 - 1]),
  io:fwrite("~w\n",[6 / 2]),
  io:fwrite("~w\n",[(2 * 4) + (4 - 6)]),
  A = 3,
  B = A + 1,
  io:fwrite("~w\n",[A + B + (A * B)]),
  io:fwrite("~w\n",[A == B]),
  io:fwrite("~w\n",[if (B > A) and (B < (A * B)) -> B; true -> A end]),
  io:fwrite("~w\n",[if (A == 4) -> 6; (B == 4) -> 6 + 7 + A; true -> 25 end]),
  io:fwrite("~w\n",[2 + (if (B > A) -> B; true -> A end)]),
  io:fwrite("~w\n",[(if (A > B) -> A; (A < B) -> B; true -> -1 end) * (A + 1)]).
