defmodule Chop do
  def guess(actual, a..b) do
    middle = get_middle a, b
    say_guess middle
    try_guess actual, a..b, middle
  end

  defp say_guess(number), do: IO.puts "Is it #{number}"

  defp try_guess(actual, _, actual), do: actual

  defp try_guess(actual, a.._, current_guess) when current_guess > actual do
    guess actual, a..current_guess
  end

  defp try_guess(actual, _..b, current_guess) when current_guess < actual do
    guess actual, current_guess..b
  end

  defp get_middle(a, b), do: a + div(b - a, 2)
end
