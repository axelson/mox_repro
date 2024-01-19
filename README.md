# MoxRepro

Repro by running
- `mix deps.get`
- `mix test`

You should see an error output like:

``` elixir
$ mix test
set expectation in #PID<0.209.0> (mox_repro_test.exs:21): WeatherBehaviourMock
Inside task (#PID<0.210.0>)
test finished
pids (mox_repro_test.exs:10): [#PID<0.210.0>]
calling mock
calling get_weather!

18:47:17.203 [error] Task #PID<0.210.0> started from #PID<0.209.0> terminating
** (Mox.UnexpectedCallError) no expectation defined for WeatherBehaviourMock.get_weather/1 in process #PID<0.210.0> (or in its callers [#PID<0.209.0>]) with args ["Chicago"]
    (mox 1.1.0) lib/mox.ex:820: Mox.__dispatch__/4
    (elixir 1.15.7) lib/task/supervised.ex:101: Task.Supervised.invoke_mfa/2
Function: #Function<0.87561592/0 in Bound.start_weather_task/1>
    Args: []


  1) test fails (MoxReproTest)
     test/mox_repro_test.exs:22
     Assertion with in failed
     code:  assert reason in [:normal, :noproc]
     left:  {%Mox.UnexpectedCallError{message: "no expectation defined for WeatherBehaviourMock.get_weather/1 in process #PID<0.210.0> (or in its callers [#PID<0.209.0>]) with args [\"Chicago\"]"}, [{Mox, :__dispatch__, 4, [file: ~c"lib/mox.ex", line: 820]}, {Task.Supervised, :invoke_mfa, 2, [file: ~c"lib/task/supervised.ex", line: 101]}]}
     right: [:normal, :noproc]
     stacktrace:
       (elixir 1.15.7) lib/enum.ex:984: Enum."-each/2-lists^foreach/1-0-"/2
       test/mox_repro_test.exs:11: anonymous fn/0 in MoxReproTest.__ex_unit_setup_0/1
       (ex_unit 1.15.7) lib/ex_unit/on_exit_handler.ex:143: ExUnit.OnExitHandler.exec_callback/1
       (ex_unit 1.15.7) lib/ex_unit/on_exit_handler.ex:129: ExUnit.OnExitHandler.on_exit_runner_loop/0


Finished in 0.5 seconds (0.00s async, 0.5s sync)
1 test, 1 failure
```
