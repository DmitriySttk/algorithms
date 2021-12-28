def sum(list)
  return 0 if list.empty?
  list[0] + sum(list[1..-1])
end

puts sum([1, 2, 3, 4, 5, 6, 7])