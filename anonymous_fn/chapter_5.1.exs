wtf = fn
  0, 0, _ -> "FizzBuzz."
  0, _, _ -> "Fizz."
  _, 0, _ -> "Buzz."
  _, _, a -> a
end

wtf2 = fn (n) -> wtf.(rem(n, 3), rem(n, 5), n) end

IO.puts wtf2.(10)
IO.puts wtf2.(11)
IO.puts wtf2.(12)
IO.puts wtf2.(13)
IO.puts wtf2.(14)
IO.puts wtf2.(15)
IO.puts wtf2.(16)
