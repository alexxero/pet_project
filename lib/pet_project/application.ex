defmodule PetProject.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications

  def start(_type, _args) do
    # Define workers and child supervisors to be supervised
    children = [Tram]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: PetProject.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
