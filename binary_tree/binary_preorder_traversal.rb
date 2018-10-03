require_relative 'tree'
# Given a binary tree, return the preorder traversal of its nodes' values.

# Example:

# Input: [1,null,2,3]
#    1
#     \
#      2
#     /
#    3

# Output: [1,2,3]

def preorder_traversal(node, stack=[])
  return [] if node.nil?

  stack.push(node.val)
  preorder_traversal(node.left, stack)
  preorder_traversal(node.right, stack)

  return stack
end

node = 
TreeNode.new(1,
            nil,
            TreeNode.new(2,
                        TreeNode.new(3)
            )
)

p preorder_traversal(node)