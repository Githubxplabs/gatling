-module (gen_websocket).

-export ([start_link/3, listen/1, send/2, get_header/1]).

% @spec start_link(Module, ListenSocket, DispatcherName) -> {ok, Pid} | {error, Reason}
start_link(Module, ListenSocket, DispatcherName) ->
    dispatcher:start_link(Module, ListenSocket, DispatcherName).


listen(Port) ->
    io:format("start websocket server: ws://localhost:~p~n", [Port]),
    Opts = [binary,
            {packet, 0},
            {reuseaddr, true},
            {active, true}],
    {ok, ListenSocket} = gen_tcp:listen(Port, Opts),
    ListenSocket.


%% @spec send(ServerName, Data) -> ok | {error, Reason}
send(ServerName, Data) ->
    websocket_server:send_data(ServerName, Data).


get_header(ServerName) ->
    websocket_server:get_header(ServerName).