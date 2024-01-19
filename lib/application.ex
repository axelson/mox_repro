defmodule MoxRepro.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Task.Supervisor, name: :my_task_supervisor},

      # Starts a worker by calling: MoxRepro.Worker.start_link(arg)
      # {MoxRepro.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MoxRepro.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
