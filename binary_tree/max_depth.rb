# Given a binary tree, find its maximum depth.

# The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

# Note: A leaf is a node with no children.

# Example:

# Given binary tree [3,9,20,null,null,15,7],


#   3
#  / \
# 9  20
#   /  \
#  15   7
TreeNode = Struct.new(:val, :left, :right)

def max_depth(node)
  return 0 if node.nil?
  return 1 + [max_depth(node.left), max_depth(node.right)].max
end

p max_depth(
  TreeNode.new(3,
    TreeNode.new(9),
    TreeNode.new(20,
      TreeNode.new(15),
      TreeNode.new(7)
    )
  )
)