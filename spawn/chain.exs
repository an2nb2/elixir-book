defmodule Chain do
  def counter(next_pid) do
    receive do
      n ->
        send next_pid, n + 1
    end
  end

  def create_processes(n) do
    last = Enum.reduce 1..n, self,
    fn (_, send_to) ->
      spawn(Chain, :counter, [send_to])
    end

    send last, 0

    receive do
      final_value when is_integer(final_value) ->
        "Result is #{inspect(final_value)}"
    end
  end

  def run(n) do
    IO.puts inspect :timer.tc(Chain, :create_processes, [n])
  end
end
