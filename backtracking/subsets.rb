# Given a set of distinct integers, nums, return all possible subsets (the power set).

# Note: The solution set must not contain duplicate subsets.


def subsets(arr)
  subsets_helper(result = [], temp = [], arr, 0)
end

def subsets_helper(result, temp, arr, index)
  puts "result:#{result}, temp: #{temp}"
  result << temp # success condition

  (index...arr.length).each do |i| # branching
    subsets_helper(result, temp + [arr[i]], arr, i + 1) # choose, explore
  end

  return result
end

# ==================== Following the permutations template

p subsets([1, 2, 3])
# p subsets([1, 1, 2])