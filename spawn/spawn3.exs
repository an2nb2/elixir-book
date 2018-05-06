defmodule Spawn3 do
  def greet do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello, #{msg}!"}
        greet
    end
  end
end

pid = spawn(Spawn2, :greet, [])
pid2 = spawn(Spawn2, :greet, [])

send pid, {self, "Anton"}
send pid2, {self, "World"}

receive do
  {:ok, msg} ->
    IO.puts msg
  after 500 ->
    IO.puts "no message received"
end

receive do
  {:ok, msg} ->
    IO.puts msg
  after 500 ->
    IO.puts "no message received"
end
