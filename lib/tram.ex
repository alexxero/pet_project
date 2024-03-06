defmodule Tram do
  use GenServer

  # Client

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def stop do
    GenServer.call(__MODULE__, :stop)
  end

  def go do
    GenServer.call(__MODULE__, :go)
  end

  def open_doors do
    GenServer.call(__MODULE__, :open_doors)
  end

  def close_doors do
    GenServer.call(__MODULE__, :close_doors)
  end

  def get_state do
    GenServer.call(__MODULE__, :get_state)
  end

  def end_shift do
    GenServer.cast(__MODULE__, :end_shift)
  end

  # Server (callbacks)

  @impl true
  def init(:ok) do
    {:ok, :start_shift}
  end

  @impl true
  def handle_call(:stop, _from, :start_shift), do: {:reply, :stop, :stop}

  @impl true
  def handle_call(:stop, _from, invalid_state), do: {:reply, :invalid_transition, invalid_state}

  @impl true
  def handle_call(:go, _from, :close_doors), do: {:reply, :go, :go}

  @impl true
  def handle_call(:go, _from, :stop), do: {:reply, :go, :go}

  @impl true
  def handle_call(:go, _from, invalid_state), do: {:reply, :invalid_transition, invalid_state}

  @impl true
  def handle_call(:open_doors, _from, :close_doors), do: {:reply, :open_doors, :open_doors}

  @impl true
  def handle_call(:open_doors, _from, :stop), do: {:reply, :open_doors, :open_doors}

  @impl true
  def handle_call(:open_doors, _from, invalid_state),
    do: {:reply, :invalid_transition, invalid_state}

  @impl true
  def handle_call(:close_doors, _from, :open_doors), do: {:reply, :close_doors, :close_doors}

  @impl true
  def handle_call(:close_doors, _from, invalid_state),
    do: {:reply, :invalid_transition, invalid_state}

  @impl true
  def handle_call(:get_state, _from, state), do: {:reply, state, state}

  @impl true
  def handle_cast(:end_shift, _state), do: {:stop, :shutdown, :end_shift}
end
