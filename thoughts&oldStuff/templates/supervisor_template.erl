-module (supervisor_template).

-behaviour (supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).


start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).


init([]) ->
    {ok, {
          {one_for_one, 5, 10},
          [
            {Id, StartFunc, Restart, Shutdown, Type, [Modules]}
          ]
         } }.