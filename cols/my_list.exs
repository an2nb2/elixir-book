defmodule MyList do
  def flatten([]), do: []
  def flatten([head = [_ | _] | tail]), do: flatten(head) ++ flatten(tail)
  def flatten([head | tail]), do: [head | flatten(tail)]
end
