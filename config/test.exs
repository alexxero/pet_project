import Config

config :pet_project, PetProject.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "pet_project_repo",
  username: "mac",
  password: "",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
