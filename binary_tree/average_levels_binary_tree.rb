require_relative 'tree'
require_relative 'queue'

# Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
# Example 1:
# Input:
#     3
#    / \
#   9  20
#     /  \
#    15   7
# Output: [3, 14.5, 11]
# Explanation:
# The average value of nodes on level 0 is 3,  on level 1 is 14.5, and

# The range of node's value is in the range of 32-bit signed integer.
# def average_of_levels(node)
#   level_order(node).map do |values|
#     values.reduce(:+) / values.size.to_f
#   end
# end

def average_of_levels(node)
  return [] if node.nil?
  return [node.val] if node.left.nil? && node.right.nil?
  average_of_levels_helper(Queue.new, [], [node])
end

def average_of_levels_helper(queue, result, buffer)
  result << average_of_nodes(buffer)
  
  buffer.each do |node|
    queue.enqueue(node.left) if node.left
    queue.enqueue(node.right) if node.right
  end

  return if queue.empty?
  buffer = []

  buffer << queue.dequeue until queue.empty?
  average_of_levels_helper(queue, result, buffer)

  return result
end

def average_of_nodes(nodes)
  nodes.map(&:val).reduce(:+) / nodes.size.to_f
end

p average_of_levels(
  TreeNode.new(3,
              TreeNode.new(9),
              TreeNode.new(20,
                          TreeNode.new(15),
                          TreeNode.new(7)
              )
  )
)