# Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.


# Input: n = 4, k = 2
# Output:
# [
#   [2,4],
#   [3,4],
#   [2,3],
#   [1,2],
#   [1,3],
#   [1,4],
# ]

      #           [1, 2, 3, 4], k = 2
      #                 |
      #   +-------------+-------------+
      #   |             |             |
      #   1             2             3 (n + 1 - k)
# [1,2] [1,3] [1,4]  [2,3] [2,4]     [3,4]



#                 [1, 2, 3, 4, 5] k = 3
      #                  |                          |         |
      #                  1                          2         3
      #     +------------+-----+---------+      +---+---+    / \
      #     |            |     |         |      |   |   |   4   5
#           2            3     4         5      3   4   5   |   |
#   +-------+------+    / \    |         |     / \  |   |   5   x
#   3       4      5   4   5   5         x    4   5 5   x

# Traverse k levels
# if node at level before k has value of nil, dead end
# push to result for each traversal

def combinations(n, k)
  result = []
  combinations_helper(result, temp = [], n, k, curr = 1)
  result
end

def combinations_helper(result, temp, n, k, curr)
  result << temp if temp.size == k

  (curr..n).each do |num|
    puts "result: #{result}, temp: #{temp}, num: #{num}"
    next if temp.last && temp.last >= num
    # choose & explore
    combinations_helper(result, temp + [num], n, k, curr + 1) 
  end
end

p combinations(4, 2)
p combinations(5, 3)