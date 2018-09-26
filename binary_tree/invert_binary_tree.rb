# Invert a binary tree.

# Example:

# Input:

#      4
#    /   \
#   2     7
#  / \   / \
# 1   3 6   9
# Output:

#      4
#    /   \
#   7     2 => Invert left and right
#  / \   / \  
# 9   6 3   1 => Invert left and right

TreeNode = Struct.new(:val, :left, :right)

def L(val, left=nil, right=nil)
  TreeNode.new(val, left, right)
end

def invert_tree(node)
  return if node.nil?

  node.left, node.right = node.right, node.left
  invert_tree(node.left)
  invert_tree(node.right)
  return node
end

p invert_tree(
  L(4,
    L(2,
      L(1),
      L(3)
    ),
    L(7,
      L(6),
      L(9)
    )
  )
)