defmodule PetProject.Artist do
  use Ecto.Schema

  schema "artists" do
    field(:name, :string)
    many_to_many(:songs, PetProject.Song, join_through: "artists_songs", on_delete: :delete_all)
  end
end
