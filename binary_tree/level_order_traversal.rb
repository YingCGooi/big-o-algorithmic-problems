require_relative 'tree'
require_relative 'queue'
# Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

# For example:
# Given binary tree [3,9,20,null,null,15,7],
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its level order traversal as:
# [
#   [3],
#   [9,20],
#   [15,7]
# ]

# queue = Queue.new
# queue.enqueue(2)
# queue.each do |val|
#   puts val
# end

def level_order(node)
  return [] if node.nil?
  return [[node.val]] if node.left.nil? && node.right.nil?
  level_order_helper(Queue.new, [], [node])
end

def level_order_helper(queue, result, buffer)
  result << buffer.map(&:val)

  buffer.each do |node|
    queue.enqueue(node.left) if node.left
    queue.enqueue(node.right) if node.right
  end

  return if queue.empty?
  buffer = []

  buffer << queue.dequeue until queue.empty?

  level_order_helper(queue, result, buffer)

  return result
end

p level_order(
  TreeNode.new(3,
              TreeNode.new(9),
              TreeNode.new(20,
                          TreeNode.new(15),
                          TreeNode.new(7)
              )
  )
)

  #   3
  #  / \
  # 9  20
  #   /  \
  #  15   7

# Enqueue Root(3)
# Empty buffer
# Dequeue and push into buffer until queue is empty
# buffer [Root(3)]
# transform buffer into array of values, push into result [[3]]
# 
# Iterate through buffer [Root(3)]
# For each node, enqueue left and right child nodes
# queue => [Node(9), Node(20)]
# Empty buffer => []
# Dequeue and push into buffer until queue is empty
# buffer [Node(9), Node(20)]
# transform buffer into array of values, push into result => [[3], [9, 20]]
#
# Iterate through buffer [Node(9), Node(20)]
# For each node, enqueue left and right child if not nil
# queue => []
# queue => [Node(15), Node(17)]
# Empty buffer => []
# Dequeue and push into buffer until queue is empty
# buffer => [Node(15), Node(17)]
# transform buffer into array of values, push into result
# result => [[3], [9,20], [15,7]]

# Iterate through buffer [Node(15), Node(7)]
# For each node, enqueue left and right child if child is not nil
# queue => []
# if queue is empty, return result


[[3], [9, 20]]
