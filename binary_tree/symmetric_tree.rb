require_relative 'treeifier'
# Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

# For example, this binary tree [1,2,2,3,4,4,3] is symmetric:

#         1
#        / \
#       2   2 <= check to see if left subtree is mirror and right s ubtree is mirror
#      / \ / \
#     3  4 4  3
#    / \     / \
#   5   6   6   5

# But the following [1,2,2,null,3,null,3] is not:
#     1
#    / \
#   2   2
#    \   \
#    3    3
def is_symmetric(node)
  return true if node.nil?
  inverted_right = invert_tree(node.right)
  same_tree(node.left, inverted_right)
end

def same_tree(node1, node2)
  return true if node1.nil? && node2.nil?
  return false if !equal(node1, node2)

  same_tree(node1.left, node2.left) &&
  same_tree(node1.right, node2.right)
end

def equal(node1, node2)
  (node1 && node1.val) == (node2 && node2.val)
end

def invert_tree(node)
  return if node.nil?

  node.left, node.right = node.right, node.left
  invert_tree(node.left)
  invert_tree(node.right)
  return node
end


# print_tree(binary_treeify([1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 10, 20, 25, 30, 50]))

