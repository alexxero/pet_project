defmodule ListerTest do
  import Lister
  use ExUnit.Case

  describe "to_list" do
    test "list" do
      assert ["test"] == to_list(["test"])
    end

    test "tuple" do
      assert [:ok, "test"] == to_list({:ok, "test"})
    end

    test "map" do
      assert [key: "test"] == to_list(%{key: "test"})
    end

    test "string" do
      assert ["t", "e", "s", "t"] == to_list("test")
    end

    test "atom" do
      assert ["t", "e", "s", "t"] == to_list(:test)
    end

    test "integer" do
      assert [1, 2, 3, 4, 5] == to_list(12_345)
    end

    test "float" do
      assert ["1", "2", "3", ".", "4", "5"] == to_list(123.45)
    end

    test "date" do
      assert ["2", "0", "2", "4", "-", "0", "3", "-", "2", "6"] == to_list(~D[2024-03-26])
    end
  end
end
