def binary_search(list, item)
  low = 0
  high = list.length - 1
  attempt = 0
  while low <= high
    mid = (low + high) / 2
    guess = list[mid]

    if guess == item
      return "attempts: #{attempt + 1}" # start from 0 so +1
    elsif guess > item
      high = mid - 1
      attempt += 1
    else
      low = mid + 1
      attempt += 1
    end
  end

  return nil
end

my_list = (1..100).to_a
puts binary_search(my_list, 5) # => 1

# We need to use .inspect here because just printing nil
# would output an empty string
puts binary_search(my_list, -1).inspect # => nil
