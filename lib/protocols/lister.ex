defprotocol Lister do
  @moduledoc "Имплементация протокола для конвертации переданных данных в список"

  @spec to_list(any()) :: list()
  def to_list(data)
end

defimpl Lister, for: List do
  @spec to_list(list()) :: list()
  def to_list(list), do: list
end

defimpl Lister, for: Tuple do
  @spec to_list(tuple()) :: list()
  defdelegate to_list(tuple), to: Tuple
end

defimpl Lister, for: Map do
  @spec to_list(map()) :: list()
  defdelegate to_list(map), to: Enum
end

defimpl Lister, for: BitString do
  @spec to_list(bitstring()) :: list()
  def to_list(string), do: String.split(string, "", trim: true)
end

defimpl Lister, for: Atom do
  @spec to_list(atom()) :: list()
  def to_list(atom), do: atom |> Atom.to_string() |> Lister.to_list()
end

defimpl Lister, for: Integer do
  @spec to_list(integer()) :: list()
  def to_list(integer), do: Integer.digits(integer)
end

defimpl Lister, for: Float do
  @spec to_list(float()) :: list()
  def to_list(float), do: Float.to_string(float) |> String.split("", trim: true)
end

defimpl Lister, for: Date do
  @spec to_list(Date.t()) :: list()
  def to_list(date), do: Date.to_string(date) |> String.split("", trim: true)
end
