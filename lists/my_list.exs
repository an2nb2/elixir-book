defmodule MyList do
  def len([]), do: 0
  def len([_|tail]), do: 1 + len(tail)
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)
  def mapsum([], _), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  def max([head | []]), do: head
  def max([head | tail]), do: Kernel.max(max(tail), head)

  def span(to, to), do: [to]
  def span(from, to), do: [from | span(from + 1, to)]
end
