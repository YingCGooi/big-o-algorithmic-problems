# On a staircase, the i-th step has some non-negative cost cost[i] assigned (0 indexed).

# Once you pay the cost, you can either climb one or two steps. You need to find minimum cost to reach the top of the floor, and you can either start from the step with index 0, or the step with index 1.

# Example 1:
# Input: cost = [10, 15, 20]
# Output: 15
# Explanation: Cheapest is start on cost[1], pay that cost and go to the top.
# Example 2:
# Input: cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
# Output: 6
# Explanation: Cheapest is start on cost[0], and only step on 1s, skipping cost[3].
# Note:
# cost will have a length in the range [2, 1000].
# Every cost[i] will be an integer in the range [0, 999].


# [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
#                    [cost[i - 2], cost[i - 1]].min + cost[i]
# base case when i == 0 return cost[0]
# when i == 1 return [cost[i - 1], cost[i]].min

def min_cost_climbing_stairs(arr)
  next_one, next_two = 0, 0
  curr = 0

  (arr.length - 1).downto(0).each do |i|
    curr = arr[i] + min(next_one, next_two)
    next_two = next_one
    next_one = curr
  end

  return min(next_one, next_two)
end

def min(a, b)
  return [a, b].min
end

p min_cost_climbing_stairs [10, 15, 20] # 15
p min_cost_climbing_stairs [1, 100, 1, 1, 1, 100, 1, 1, 100, 1] # 6

[1, 100, 1, 1, 1, 100, 1, 1, 100, 1]  0  0
                                  C  F1  F2

[1, 100, 1, 1, 1, 100, 1, 1, 100, 1] 
                              C   F1  F2
                              1   1   0

[1, 100, 1, 1, 1, 100, 1, 1, 100, 1] 
                          C   F1  F2
                          2   101  1                                 