%%%-------------------------------------------------------------------
%%% @author Bill Wang <freecnpro@gmail.com>
%%% @copyright (C) 2015, Freecnpro.net
%%% @doc
%%%
%%% @end
%%% Created : 17. Jun 2015 11:34 AM
%%%-------------------------------------------------------------------
-module(observerweb).
-author("freecnpro@gmail.com").

%% API
-export([try_rpc/4]).

try_rpc(Node, Mod, Func, Args) ->
  case rpc:call(Node, Mod, Func, Args) of
    {badrpc, Reason} ->
      error_logger:error_report([{node, Node},
        {call, {Mod, Func, Args}},
        {reason, {badrpc, Reason}}]),
      error({badrpc, Reason});
    Res ->
      Res
  end.