defmodule WeatherImpl do
  @moduledoc """
  An implementation of a WeatherBehaviour
  """

  @behaviour WeatherBehaviour

  @impl WeatherBehaviour
  def get_weather(city) when is_binary(city) do
    # Here you could call an external api directly with an HTTP client or use a third
    # party library that does that work for you. In this example we send a
    # request using a `httpc` to get back some html, which we can process later.

    :inets.start()
    :ssl.start()

    case :httpc.request(:get, {"https://www.google.com/search?q=weather+#{city}", []}, [], []) do
      {:ok, {_, _, html_content}} -> {:ok, %{body: html_content}}
      error -> {:error, "Error getting weather: #{inspect(error)}"}
    end
  end
end
