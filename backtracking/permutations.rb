# Given a collection of distinct integers, return all possible permutations.


def permutations(arr)
  permutations_helper(result = [], temp = [], arr)
end

def permutations_helper(result, temp, arr)
  # puts "result:#{result}, temp: #{temp}" # for debugging
  return result << temp if temp.size >= arr.size # success condition

  (0...arr.length).each do |i| # branching
    next if temp.include?(arr[i]) # dead end condition
    temp += [arr[i]] # choose
    permutations_helper(result, temp, arr) # explore
    temp = temp[0...-1] # unchoose
  end

  return result
end

p permutations([1, 2, 3])
# [
#   [1,2,3],
#   [1,3,2],
#   [2,1,3],
#   [2,3,1],
#   [3,1,2],
#   [3,2,1]
# ]