defmodule PetProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  import Supervisor.Spec

  @impl true
  def start(_type, _args) do
    children = [
      supervisor(PetProject.Repo, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PetProject.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
