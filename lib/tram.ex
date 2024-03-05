defmodule Tram do
  use GenServer

  # Client

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok)
  end

  def stop() do
    GenServer.call(__MODULE__, :stop)
  end

  def go() do
    GenServer.call(__MODULE__, :stop)
  end

  def open_doors() do
    GenServer.call(__MODULE__, :open_doors)
  end

  def close_doors() do
    GenServer.call(__MODULE__, :open_doors)
  end

  def end_shift() do
    GenServer.cast(__MODULE__, :end_shift)
  end

  def error_message() do
    {:error, "Operation is denied"}
  end

  # Server (callbacks)

  @impl true
  def init(:ok) do
    {:ok, :start_shift}
  end

  @impl true
  def handle_call(:stop, _from, state) do
    case state do
      :start_shift -> {:reply, :ok, :stop}
      _invalid_state -> {:reply, :invalid_transition, state}
    end
  end

  @impl true
  def handle_call(:go, _from, state) do
    case state do
      :close_doors -> {:reply, :ok, :go}
      :stop -> {:reply, :ok, :go}
      _invalid_state -> {:reply, :invalid_transition, state}
    end
  end

  @impl true
  def handle_call(:open_doors, _from, state) do
    case state do
      :close_doors -> {:reply, :ok, :close_doors}
      :stop -> {:reply, :ok, :close_doors}
      _invalid_state -> {:reply, :invalid_transition, state}
    end
  end

  @impl true
  def handle_call(:close_doors, _from, state) do
    case state do
      :open_doors -> {:reply, :ok, :close_doors}
      _invalid_state -> {:reply, :invalid_transition, state}
    end
  end

  @impl true
  def handle_cast(:end_shift, _state) do
    {:noreply, :end_shift}
  end
end
