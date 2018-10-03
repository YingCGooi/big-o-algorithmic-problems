# You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

# Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

# Example 1:

# Input: [1,2,3,1]
# Output: 4
# Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
#              Total amount you can rob = 1 + 3 = 4.
# Example 2:

# Input: [2,7,9,3,1]
# Output: 12
# Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
#              Total amount you can rob = 2 + 9 + 1 = 12.

[2, 7, 9, 1, 1, 3, 1, 4]
# Brute Force
# 2 + 9 + 1 + 1
# 2 + 9 + 3 + 4
# 2 + 9 + 1
# 2 + 9 + 1
# ..
# 2 + 9 + 4

# 2 + 1 + 1 + 1
# 2 + 1 + 1

# Subproblem
# rob_houses_not_adjacent(i = 0) + rob_houses_not_adjacent(i = 2)


#                   [2] # index = n                                                                     [7]
#                    |
#  [9,                  1,            1,     3,            1, 4]  # index from n + 2 to last index
#   |                   |             |      |             |
# [1, 3, 1, 4]    [3, 1, 4]         [1, 4]  [4]            []  # index (4..-1) | index (6..-1)
#  |   \
# [1, 4][4] # => two numbers => take the max
#  |
#  _


def rob(arr)
  return 0 if arr.empty?
  return arr[0] if arr.size == 1
  rob_helper(arr, 0, {})
end

def rob_helper(arr, i, memo)
  return [memo[i - 1], memo[i - 2]].max if i >= arr.length
  memo[i - 2] ||= 0
  memo[i - 3] ||= 0
  memo[i] = arr[i] + [memo[i - 2], memo[i - 3]].max

  rob_helper(arr, i + 1, memo)
end

def rob(nums)
  return nums[0] if nums.size == 1
  return nums.max if nums.size == 2
  prev_loot = curr_loot = 0
  nums.each do |num|
    # prev, curr = 0, 2
    # prev, curr = 2, [7, 2].max => 2, 7
    # prev, curr = 7, [2 + 9, 7].max => 7, 11
    # prev, curr = 11, [7 + 1, 11].max => 11, 11
    prev_loot, curr_loot = curr_loot, [prev_loot + num, curr_loot].max
  end
  curr_loot
end

p rob([2, 7, 9, 1, 1, 3, 1, 4])
p rob([1,2,3,1])
p rob([2,7,9,3,1])