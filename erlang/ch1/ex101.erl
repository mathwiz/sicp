-module(ex101).
-author("Yohan").

%% API
-export([expressions/0]).

expressions() ->
  io:fwrite("~w\n",[10]),
  io:fwrite("~w\n",[5+3+4]),
  io:fwrite("~w\n",[-1]).
