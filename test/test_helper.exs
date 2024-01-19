Mox.defmock(WeatherBehaviourMock, for: WeatherBehaviour)
Application.put_env(:bound, :weather, WeatherBehaviourMock)
ExUnit.start()
