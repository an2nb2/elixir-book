defmodule Stack.Server do
  use GenServer

  def start_link(stash) do
    GenServer.start_link(__MODULE__, stash, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(new_element) do
    GenServer.cast(__MODULE__, { :push, new_element })
  end

  def handle_call(:pop, _from, { [head | tail], stash }) do
    { :reply, head, { tail, stash } }
  end

  def handle_cast({ :push, new_element }, { current_stack, stash }) do
    { :noreply, { [new_element | current_stack], stash } }
  end

  def init(stash) do
    current_list = Stack.Stash.get_value(stash)
    { :ok, { current_list, stash } }
  end

  def terminate(_reason, { current_list, stash }) do
    Stack.Stash.save_value(stash, current_list)
  end
end
