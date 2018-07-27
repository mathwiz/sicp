%%%-------------------------------------------------------------------
%%% @author Yohan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. Jul 2018 10:21 AM
%%%-------------------------------------------------------------------
-module(ex104).
-author("Yohan").

%% API
-export([main/0, a_plus_abs_b/2]).

main() ->
  io:fwrite("~w\n",[a_plus_abs_b(-1,-1)]),
  io:fwrite("~w\n",[a_plus_abs_b(-1,-1)]),
  io:fwrite("~w\n",[a_plus_abs_b(2,3)]),
  io:fwrite("~w\n",[a_plus_abs_b(2,-3)]),
  io:fwrite("~w\n",[a_plus_abs_b(-2,3)]),
  io:fwrite("~w\n",[a_plus_abs_b(-2,-3)]).


%%% Clearly unnecessary use of lambdas
a_plus_abs_b(A, B) when B < 0 -> (fun(X,Y)-> X-Y end)(A, B);
a_plus_abs_b(A, B) -> (fun(X,Y)-> X+Y end)(A, B).
