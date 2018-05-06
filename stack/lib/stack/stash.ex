defmodule Stack.Stash do
  use GenServer

  def start_link(value) do
    { :ok, _pid } = GenServer.start_link(__MODULE__, value, name: __MODULE__)
  end

  def get_value(pid) do
    GenServer.call(pid, :get_value)
  end

  def save_value(pid, value) do
    GenServer.cast(pid, { :save_value, value })
  end

  def handle_call(:get_value, _from, value) do
    { :reply, value, value }
  end

  def handle_cast({ :save_value, value }, _current_value) do
    { :noreply, value }
  end
end
