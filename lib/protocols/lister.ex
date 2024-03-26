defprotocol Lister do
  def to_list(data)
end

defimpl Lister, for: List do
  def to_list(list), do: list
end

defimpl Lister, for: Tuple do
  defdelegate to_list(tuple), to: Tuple
end

defimpl Lister, for: Map do
  defdelegate to_list(map), to: Enum
end

defimpl Lister, for: BitString do
  def to_list(string), do: String.split(string, "", trim: true)
end

defimpl Lister, for: Atom do
  def to_list(atom), do: Atom.to_string(atom) |> String.split("", trim: true)
end

defimpl Lister, for: Integer do
  def to_list(integer), do: Integer.digits(integer)
end

defimpl Lister, for: Float do
  def to_list(float), do: Float.to_string(float) |> String.split("", trim: true)
end

defimpl Lister, for: Date do
  def to_list(date), do: Date.to_string(date) |> String.split("", trim: true)
end
