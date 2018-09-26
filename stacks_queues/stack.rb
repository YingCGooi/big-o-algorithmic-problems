require_relative "node_module"

# []
# [A ->] push(A) - size 1
# [B -> A ->] push(B) - size 2
# [A ->] pop - size 1
# [] pop - size 0

class Stack
  attr_reader :size

  def initialize
    @head = nil
    @size = 0
  end

  def push(val)
    @head = Node.new(val, @head)
    @size += 1
    val
  end

  def pop
    popped = @head
    if !@head.nil?
      @head = @head.next
      @size -= 1
    end
    popped && popped.val
  end

  def peek
    @head && @head.val
  end

  def empty?
    @size == 0
  end

  def to_s
    @head.to_s
  end
end

# stack = Stack.new
# stack.push('hello')
# puts stack
# p stack.pop

# stack = Stack.new
# puts stack, stack.size, "==="
# stack.push(1)
# puts stack, stack.size, "==="
# stack.push(2)
# puts stack, stack.size, stack.peek, "==="
# stack.pop
# puts stack, stack.size, "==="
# stack.pop
# puts stack, stack.size, "==="