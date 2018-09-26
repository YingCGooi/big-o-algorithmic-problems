# Given two binary trees, write a function to check if they are the same or not.

# Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

# Example 1:

# Input:     1         1
#           / \       / \
#          2   3     2   3

#         [1,2,3],   [1,2,3]

# Output: true
# Example 2:

# Input:     1         1
#           /           \
#          2             2

#         [1,2],     [1,null,2]

# Output: false
# Example 3:

# Input:     1         1
#           / \       / \
#          2   1     1   2

#         [1,2,1],   [1,1,2]
# Output: false

# Input: 2 tree nodes
# Output: boolean

# Recursive:
# Check to see if left subtree is the same as right subtree
# Subproblem:
# return false if node1 val != node2 val

TreeNode = Struct.new(:val, :left, :right)

def same_tree(node1, node2)
  return true if node1.nil? && node2.nil?
  return false if !equal(node1, node2)

  same_tree(node1.left, node2.left) &&
  same_tree(node1.right, node2.right)
end

def equal(node1, node2)
  (node1 && node1.val) == (node2 && node2.val)
end

root1 = TreeNode.new(1,
          TreeNode.new(2),
          TreeNode.new(3)
        )

root2 = TreeNode.new(1,
          TreeNode.new(2),
          TreeNode.new(3)
        )

p same_tree(root1, root2) # true

root1 = TreeNode.new(1,
         TreeNode.new(2)
        )

root2 = TreeNode.new(1,
          nil,
          TreeNode.new(2)
        )

p same_tree(root1, root2) # false
