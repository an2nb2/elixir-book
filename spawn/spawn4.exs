defmodule Spawn4 do
  def greet(parent) do
    send parent, "Hi"
    raise "boom"
  end

  def run do
    spawn_monitor(Spawn4, :greet, [self])

    :timer.sleep(500)

    receive do
      msg ->
        IO.puts inspect msg
    after 500 ->
        IO.puts "no message received"
    end

    receive do
      msg ->
        IO.puts inspect msg
    after 500 ->
        IO.puts "no message received"
    end
  end
end
