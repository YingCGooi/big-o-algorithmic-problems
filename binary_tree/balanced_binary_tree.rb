TreeNode = Struct.new(:val, :left, :right)

#       1
#      / \
#     2   2
#    / \
#   3   3
#  / \
# 4   4

# left_counter = 0
# right_counter = 0
# return (left_counter - right_counter).abs <= 1

#        1
#       / \
#      2   2
#     / \   \
#    3   3   1
#   / \
#  4   4
# /
#5

def max_depth(node)
  return 0 if node.nil?
  [max_depth(node.left), max_depth(node.right)].max + 1
end

def is_balanced(node, counter = 0)
  return true if node.nil?
  return false if !balanced?(node)
  is_balanced(node.left) && is_balanced(node.right)
end

def balanced?(node)
  (max_depth(node.left) - max_depth(node.right)).abs <= 1
end

p is_balanced(
  TreeNode.new(3,
    TreeNode.new(9),
    TreeNode.new(20, 
      TreeNode.new(15),
      TreeNode.new(7)
    )
  )
)

p is_balanced(
  TreeNode.new(1,
    TreeNode.new(2,
      TreeNode.new(3,
        TreeNode.new(4),
        TreeNode.new(4)
      ),
      TreeNode.new(3)
    ),
    TreeNode.new(2)
  )
)