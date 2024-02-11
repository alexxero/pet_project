defmodule PetProjectTest do
  use ExUnit.Case
  doctest PetProject

  test "greets the world" do
    assert PetProject.hello() == :world
  end
end
