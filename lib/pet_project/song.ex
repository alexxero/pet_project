defmodule PetProject.Song do
  use Ecto.Schema

  schema "songs" do
    field(:name, :string)

    many_to_many(:artists, PetProject.Artist,
      join_through: "artists_songs",
      on_delete: :delete_all
    )
  end
end
