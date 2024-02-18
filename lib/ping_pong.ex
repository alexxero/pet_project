defmodule PingPong do
  @moduledoc """
  Module is serving for testing connection between two elixir nodes
  """

  @doc """
  Send message to the first node from Node.list() output.

  ## Examples

      iex> PingPong.send_msg()
      :ok

  """
  def send_msg do
    [dest] = Node.list
    Process.send({:node, dest}, :ping, [])
  end

  @doc """
  Receiving message connected elixir node and sends response if message is :ping.
  Otherwise, prints the message

  ## Examples

      iex> PingPong.receive_msg()
      :ok

  """
  def receive_msg do
    [dest] = Node.list

    receive do
      :ping -> Process.send({:node, dest}, {:pong, node()}, [])
      msg -> IO.inspect(msg)
    end
  end
end
