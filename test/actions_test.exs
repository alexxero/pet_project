defmodule ActionsTest do
  use ExUnit.Case

  alias Actions

  describe "subtract/2" do
    test "integers" do
      assert 1 == Actions.subtract(2, 1)
    end

    test "floats" do
      assert 1.1 == Actions.subtract(2.1, 1.0)
    end

    test "mixed attrs" do
      assert 1.0 == Actions.subtract(2, 1.0)
    end

    test "another mixed attrs" do
      assert 1.0 == Actions.subtract(2.0, 1)
    end

    test "invalid attrs" do
      assert "Invalid params" == Actions.subtract("2", [1.0])
    end
  end

  describe "sum/2" do
    test "integers" do
      assert 3 == Actions.sum(2, 1)
    end

    test "floats" do
      assert 3.1 == Actions.sum(2.1, 1.0)
    end

    test "mixed attrs" do
      assert 3.0 == Actions.sum(2, 1.0)
    end

    test "another mixed attrs" do
      assert 3.0 == Actions.sum(2.0, 1)
    end

    test "invalid attrs" do
      assert "Invalid params" == Actions.sum("2", [1.0])
    end
  end

  describe "division/2" do
    test "integers" do
      assert 2 == Actions.division(2, 1)
    end

    test "floats" do
      assert 2.1 == Actions.division(2.1, 1.0)
    end

    test "mixed attrs" do
      assert 2.0 == Actions.division(2, 1.0)
    end

    test "another mixed attrs" do
      assert 2.0 == Actions.division(2.0, 1)
    end

    test "invalid attrs" do
      assert "Invalid params" == Actions.division("2", [1.0])
    end
  end

  describe "multiplication/2" do
    test "integers" do
      assert 2 == Actions.multiplication(2, 1)
    end

    test "floats" do
      assert 2.1 == Actions.multiplication(2.1, 1.0)
    end

    test "mixed attrs" do
      assert 2.0 == Actions.multiplication(2, 1.0)
    end

    test "another mixed attrs" do
      assert 2.0 == Actions.multiplication(2.0, 1)
    end

    test "invalid attrs" do
      assert "Invalid params" == Actions.multiplication("2", [1.0])
    end
  end

  describe "power/2" do
    test "integers" do
      assert 8 == Actions.power(2, 3)
    end

    test "floats" do
      assert 9.261000000000001 == Actions.power(2.1, 3.0)
    end

    test "mixed attrs" do
      assert 2.8284271247461903 == Actions.power(2, 1.5)
    end

    test "another mixed attrs" do
      assert 32.0 == Actions.power(2.0, 5)
    end

    test "invalid attrs" do
      assert "Invalid params" == Actions.power("2", [1.0])
    end
  end
end
