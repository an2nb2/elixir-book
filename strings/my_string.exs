defmodule MyString do
  def anagram?(word1, word2), do: Enum.empty?(word1 -- word2) && Enum.empty?(word2 -- word1)

  def center(strs) do
    longest = Enum.map(strs, &String.length/1) |> Enum.max

    strs
    |> Enum.sort_by(&String.length/1)
    |> Enum.each(fn (str) ->
      IO.puts String.rjust(str, round((longest + String.length(str)) / 2) + 1)
    end)
  end

  def capitalize_sentences(sentences) do
    sentences
    |> String.split(". ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(". ")
  end

  def calculate(expression), do: _calculate_expression(expression, 0)
  defp _calculate_expression([ 32 | tail], value), do: _calculate_expression(tail, value)
  defp _calculate_expression([ ?+ | tail], value), do: value + _calculate_expression(tail, 0)
  defp _calculate_expression([ ?- | tail], value), do: value - _calculate_expression(tail, 0)
  defp _calculate_expression([ ?/ | tail], value), do: value / _calculate_expression(tail, 0)
  defp _calculate_expression([ ?* | tail], value), do: value * _calculate_expression(tail, 0)
  defp _calculate_expression([], value), do: value
  defp _calculate_expression([ head | tail], value) when head in '0123456789' do
    _calculate_expression(tail, value * 10 + head - ?0)
  end
end
