defmodule Bound do
  def start_weather_task(city) do
    Task.Supervisor.start_child(:my_task_supervisor, fn ->
      IO.puts("Inside task (#{inspect(self())})")
      Process.sleep(500)
      IO.puts("calling mock")

      get_weather(city)
    end)

    :ok
  end

  def get_weather(city) do
    IO.puts("calling get_weather!")
    weather_impl().get_weather(city)
  end

  defp weather_impl() do
    Application.get_env(:bound, :weather, WeatherImpl)
  end
end
