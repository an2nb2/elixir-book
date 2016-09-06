defmodule MyEnum do
  def all?([head | []], func), do: func.(head)
  def all?([head | tail], func), do: func.(head) and all?(tail, func)

  def each([head | []], func), do: func.(head)
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([head | []], func) do
    if func.(head) do
      [head]
    else
      []
    end
  end

  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def take(_, 0), do: []
  def take([head | tail], counter), do: [head | take(tail, counter-1)]

  def split(list, counter) when counter <= 0, do: { [], list }
  def split([head | tail], counter) do
    { left, right } = split(tail, counter - 1)
    { [head | left], right }
  end
end
