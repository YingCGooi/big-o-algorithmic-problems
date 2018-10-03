# Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.

# An example is the root-to-leaf path 1->2->3 which represents the number 123.

# Find the total sum of all root-to-leaf numbers.

# Note: A leaf is a node with no children.

# Example:

# Input: [1,2,3]
#     1
#    / \
#   2   3
# Output: 25
# Explanation:
# The root-to-leaf path 1->2 represents the number 12.
# The root-to-leaf path 1->3 represents the number 13.
# Therefore, sum = 12 + 13 = 25.
# Example 2:

# Input: [4,9,0,5,1]
#     4
#    / \
#   9   0
#  / \
# 5   1
# Output: 1026
# Explanation:
# The root-to-leaf path 4->9->5 represents the number 495.
# The root-to-leaf path 4->9->1 represents the number 491.
# The root-to-leaf path 4->0 represents the number 40.
# Therefore, sum = 495 + 491 + 40 = 1026.

#=========================================================

# Post order traversal
# Left -> Right -> Root
# initialize accumulator = ''
# for each level down, increment level
# for each level down, accumulate value to accumulator based on level
# when hit the end of the node, push accumulator into result array
# sum result array

TreeNode = Struct.new(:val, :left, :right)

def sum_numbers(node)
  return 0 if node.nil?
  num_reps_of_routes = sum_numbers_helper(node, '', [])
  num_reps_of_routes.reduce(0) { |sum, num_str| sum + num_str.to_i }
end

def sum_numbers_helper(node, accumulator, result)
  return if node.nil?
  accumulator += node.val.to_s
  return result << accumulator if node.left.nil? && node.right.nil?

  sum_numbers_helper(node.left, accumulator, result)
  sum_numbers_helper(node.right, accumulator, result)

  return result
end

p sum_numbers(
  TreeNode.new(4,
              TreeNode.new(9,
                          TreeNode.new(5),
                          TreeNode.new(1)
              ),
              TreeNode.new(0)
  )
)

p sum_numbers(
  TreeNode.new(0,
              TreeNode.new(1)
  )
)
