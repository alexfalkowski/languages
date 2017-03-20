-module(area_server).
-export([rpc/2, loop/0]).

rpc(Pid, Request) ->
  Pid ! {self(), Request},
  receive
    Response -> Response
  end.

loop() ->
  receive
    {From, {rectangle, Width, Ht}} -> From ! {ok, Width * Ht};
    {From, {circle, R}} -> From! {ok, 3.14159*R*R};
    {From, Other} -> From ! {error,Other}
  end,
  loop().
