defmodule Client do
  @interval 2000
  @name :ticker

  def start do
    Client.register
  end

  def register do
    case :global.whereis_name(@name) do
      :undefined ->
        pid = spawn(__MODULE__, :generator2, [])
        :global.register_name(@name, pid)
      server_pid ->
        pid = spawn(__MODULE__, :receiver2, [])
        send server_pid, { :register, pid }
    end
  end

  def receiver(next_pid) do
    receive do
      { :tick } ->
        IO.puts "tock in client"
        generator(next_pid)
    end
  end

  def receiver2 do
    receive do
      { :tick, next_pid } ->
        IO.puts "tock in client"
        generator(next_pid)
    end
  end

  def generator2 do
    receive do
      { :register, new_pid } ->
        send new_pid, { :tick, self }
        receiver(new_pid)
    end
  end

  def generator(next_pid) do
    receive do
      { :register, new_pid } ->
        send new_pid, { :tick, next_pid }
        receiver(new_pid)
    after
      @interval ->
        send next_pid, { :tick }
        receiver(next_pid)
    end
  end
end
