-module(afile_server).
-export([start/1, loop/1]).

start(Dir) -> spawn(afile_server, loop, [Dir]).
loop(Dir) ->
  receive
    {Client, list_dir} -> Client ! {self(), file:list_dir(Dir)};
    {Client, {get_file, File}} -> Client ! {self(), file:read_file(filename:join(Dir, File))};
    {Client, {put_file, File, Data}} ->
      Client ! {self(), file:write_file(filename:join(Dir, File), io_lib:fwrite("~p\n", [Data]))}
  end,
  loop(Dir).
