defmodule PetProjectTest do
  use ExUnit.Case
  doctest PetProject

  describe "parse_attr/1" do
    test "returns integer, float or an error" do
      assert 1 == PetProject.parse_attr("1")
      assert -2 == PetProject.parse_attr("-2")
      assert 3.45 == PetProject.parse_attr("3.45")

      assert_raise ArgumentError, fn ->
        PetProject.parse_attr("2.a")
      end
    end
  end
end
