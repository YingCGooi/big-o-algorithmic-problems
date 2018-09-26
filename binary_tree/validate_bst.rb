# Given a binary tree, determine if it is a valid binary search tree (BST).

# Assume a BST is defined as follows:

# The left subtree of a node contains only nodes with keys less than the node's key.
# The right subtree of a node contains only nodes with keys greater than the node's key.
# Both the left and right subtrees must also be binary search trees.
# Example 1:

# Input:
#     2
#    / \
#   1   3
# Output: true
# Example 2:

#     5
#    / \
#   1   4
#      / \
#     3   6
# Output: false
# Explanation: The input is: [5,1,4,null,null,3,6]. The root node's value
#              is 5 but its right child's value is 4.
TreeNode = Struct.new(:val, :left, :right)

def L(val, left=nil, right=nil)
  TreeNode.new(val, left, right)
end

INF = Float::INFINITY

def is_valid_bst(node, min=-INF, max=INF)
  return true if node.nil?
  return false if !valid_left_right_node(node, min, max)

  is_valid_bst(node.left, min, node.val) && 
  is_valid_bst(node.right, node.val, max)
end

def valid_left_right_node(node, min, max)
  return false if node.val >= max || node.val <= min

  left_node_value = (node.left&.val) || -INF
  right_node_value = (node.right&.val) || INF

  left_node_value < node.val &&
  node.val < right_node_value
end

root1 = 
  TreeNode.new(2,
    TreeNode.new(1),
    TreeNode.new(3)
  )

root2 = 
  TreeNode.new(5,
    TreeNode.new(1),
    TreeNode.new(4,
      TreeNode.new(3),
      TreeNode.new(6)
    )
  )

root3 = 
  TreeNode.new(10,
    TreeNode.new(5),
    TreeNode.new(15,
      TreeNode.new(6),
      TreeNode.new(20)
    )
  )

root4 = 
  L(3,
    L(1,
      L(0),
      L(2, 
        nil, 
        L(3))),
    L(5,
      L(4),
      L(6))
  )

p is_valid_bst(root1) # true
p is_valid_bst(root2) # false
p is_valid_bst(root3) # false
p is_valid_bst(root4) # false