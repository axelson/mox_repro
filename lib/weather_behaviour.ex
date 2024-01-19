defmodule WeatherBehaviour do
  @callback get_weather(binary()) :: {:ok, map()} | {:error, binary()}
end
