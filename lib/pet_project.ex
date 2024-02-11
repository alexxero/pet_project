defmodule PetProject do
  @moduledoc """
  Base module for `PetProject`.
  """

  @doc """
  The Calculator itself
  """
  def perform do
    operation =
      "What operation would you like to do: +, -, /, *, **?\n"
      |> input_helper
      |> validate_operator

    attr1 =
      "Enter a integer or irrational number as a first argument\n"
      |> input_helper
      |> parse_attr

    attr2 =
      "Enter a integer or irrational number as a second argument\n"
      |> input_helper
      |> parse_attr

    case operation do
      "+" -> Actions.sum(attr1, attr2)
      "-" -> Actions.subtract(attr1, attr2)
      "/" -> Actions.division(attr1, attr2)
      "*" -> Actions.multiplication(attr1, attr2)
      "**" -> Actions.power(attr1, attr2)
    end
  end

  def input_helper(string) do
    string
    |> IO.gets()
    |> String.trim()
  end

  def validate_operator(operator) when operator in ["+", "-", "*", "**", "/"] do
    operator
  end

  def validate_operator(_operator) do
    raise "Invalid operator, please try again"
  end

  def parse_attr(attr) do
    attr
    |> String.contains?(".")
    |> case do
      true -> String.to_float(attr)
      false -> String.to_integer(attr)
    end
  end
end
