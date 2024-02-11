defmodule Actions do
  def subtract(attr1, attr2)
      when is_integer(attr1) or (is_float(attr1) and is_integer(attr2)) or is_float(attr2) do
    attr1 - attr2
  end

  def subtract(_attr1, _attr2) do
    "Invalid params"
  end

  def sum(attr1, attr2)
      when is_integer(attr1) or (is_float(attr1) and is_integer(attr2)) or is_float(attr2) do
    attr1 + attr2
  end

  def sum(_attr1, _attr2) do
    "Invalid params"
  end

  def division(attr1, attr2)
      when is_integer(attr1) or (is_float(attr1) and is_integer(attr2)) or is_float(attr2) do
    attr1 / attr2
  end

  def division(_attr1, _attr2) do
    "Invalid params"
  end

  def multiplication(attr1, attr2)
      when is_integer(attr1) or (is_float(attr1) and is_integer(attr2)) or is_float(attr2) do
    attr1 * attr2
  end

  def multiplication(_attr1, _attr2) do
    "Invalid params"
  end

  def power(attr1, attr2)
      when is_integer(attr1) or (is_float(attr1) and is_integer(attr2)) or is_float(attr2) do
    attr1 ** attr2
  end

  def power(_attr1, _attr2) do
    "Invalid params"
  end
end
