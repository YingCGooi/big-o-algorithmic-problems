# Given a collection of numbers that might contain duplicates, return all possible unique permutations.


#           0       1        2
#         x 1 2   0 x 2    0 1 x
#      xxx xx2 x1x...

# iterate through each index
# push into temp
# for each index, iterate through each index excluding the current index
# push into temp
# when arrived at the level == arr.size, push into temp, push into results if not included

def permute_unique(arr)
  result = {}
  permute_unique_helper(result, temp = [], arr, 0)
  result.keys
end

def permute_unique_helper(result, temp, arr, index)
  if temp.size == arr.size
    numbers = temp.map { |i| arr[i] }
    return result[numbers] = true
  end

  (0...arr.length).each do |i|
    puts "result:#{result}, temp: #{temp}, index: #{index}, i: #{i}"
    next if temp.include?(i)
    permute_unique_helper(result, temp + [i], arr, i)
  end
end

p permute_unique([1, 1, 2])