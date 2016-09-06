prefix = fn pr ->
  fn sf -> "#{pr} #{sf}" end
end

ms = prefix.("Ms.")
IO.puts ms.("Smith")
