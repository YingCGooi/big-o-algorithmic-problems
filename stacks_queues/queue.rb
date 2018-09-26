require_relative 'node_module'
# Implement a queue by using a link list data structure

# D -> []
# D -> [A ->] enqueue(A) - size 1
# D -> [A -> B ->] enqueue(B) - size 2
# D -> [B ->] dequeue - size 1
# D -> [] dequeue - size 0

class Queue
  attr_reader :size

  def initialize
    @head = nil
    @tail = @head
    @size = 0
  end

  def enqueue(val)
    if @head.nil?
      @head = Node.new(val)
      @tail = @head
    else
      @tail.next = Node.new(val)
      @tail = @tail.next
    end

    @size += 1
    val
  end

  def dequeue
    if @head
      @head = @head.next
      @size -= 1
    end
  end

  def find(n)
    curr = @head
    counter = 0
    
    until counter == n
      curr = curr.next
      counter += 1
    end
    
    return curr && curr.val
  end

  def head
    @head && @head.val
  end

  def tail
    @tail && @tail.val
  end

  def to_s
    @head.to_s
  end
end

# queue = Queue.new
# queue.enqueue(1)
# puts queue, queue.size
# puts "==="
# queue.enqueue(2)
# puts queue, queue.size, queue.head, queue.tail
# puts "==="
# p find0: queue.find(0)
# p find1: queue.find(1)
# puts "==="
# queue.dequeue
# puts queue, queue.size
# puts "==="
# queue.dequeue
# puts queue, queue.size
# puts "==="
# queue.dequeue
# puts queue, queue.size
