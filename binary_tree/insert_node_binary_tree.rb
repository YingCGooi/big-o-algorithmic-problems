require_relative 'tree'
# Insertion of a key
# A new key is always inserted at leaf. We start searching a key from root till we hit a leaf node. Once a leaf node is found, the new node is added as a child of the leaf node.

#          100                               100
#         /   \        Insert 40            /    \
#       20     500    --------->          20     500 
#      /  \                              /  \  
#     10   30                           10   30
#                                              \   
#                                               40

def insert(node, value)
  if node.left.nil? && value < node.val
    return node.left = TreeNode.new(value)
  elsif node.right.nil? && value > node.val
    return node.right = TreeNode.new(value)
  end

  insert(node.left, value) if value < node.val
  insert(node.right, value) if value > node.val

  return node
end

root = TreeNode.treeify([100, 20, 500, 10, 30])

puts insert(root, 40)
p insert(root, 40)