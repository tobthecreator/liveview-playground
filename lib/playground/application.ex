defmodule Playground.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PlaygroundWeb.Telemetry,
      Playground.Repo,
      {DNSCluster, query: Application.get_env(:playground, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Playground.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Playground.Finch},
      # Start a worker by calling: Playground.Worker.start_link(arg)
      # {Playground.Worker, arg},
      # Start to serve requests, typically the last entry
      PlaygroundWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Playground.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PlaygroundWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
