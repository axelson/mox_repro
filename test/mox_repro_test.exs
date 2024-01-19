defmodule MoxReproTest do
  use ExUnit.Case
  import Mox

  # setup :verify_on_exit!

  setup do
    on_exit(fn ->
      Task.Supervisor.children(:my_task_supervisor)
      |> IO.inspect(label: "pids (mox_repro_test.exs:10)")
      |> Enum.each(fn pid ->
        ref = Process.monitor(pid)
        assert_receive {:DOWN, ^ref, _, _, reason}, 500

        # Assert that the process exited normally
        assert reason in [:normal, :noproc]
      end)
      Process.sleep(1000)
    end)
  end

  test "fails" do
    expect(WeatherBehaviourMock, :get_weather, fn args ->
      IO.puts("In expectation")
      # here we can assert on the arguments that get passed to the function
      assert args == "Chicago"

      # here we decide what the mock returns
      {:ok, %{body: "Some html with weather data"}}
    end)
    |> IO.inspect(label: "set expectation in #{inspect(self())} (mox_repro_test.exs:21)")

    assert Bound.start_weather_task("Chicago")
    Process.sleep(100)
    IO.puts("test finished")
    # Process.sleep(1000)
  end
end
