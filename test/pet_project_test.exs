defmodule PetProjectTest do
  use ExUnit.Case
  use ExUnit.Case
  alias PetProject.Artist
  alias PetProject.Song
  alias PetProject.Repo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)

    artist = Repo.insert!(%Artist{name: "Beatles"}) |> Repo.preload(:songs)
    song1 = Repo.insert!(%Song{name: "Yesterday"})
    song2 = Repo.insert!(%Song{name: "Blackbird"})
    artist_changeset = Ecto.Changeset.change(artist)
    artist_with_songs = Ecto.Changeset.put_assoc(artist_changeset, :songs, [song1, song2])
    {:ok, artist} = Repo.update(artist_with_songs)
    {:ok, artist: artist, song1: song1, song2: song2}
  end

  test "creates an artist with songs", %{artist: artist, song1: song1, song2: song2} do
    assert [song1, song2] == artist.songs
  end

  test "removes associated song", %{artist: artist} do
    Repo.delete(artist)
    assert 2 == Repo.all(Song)
  end
end
