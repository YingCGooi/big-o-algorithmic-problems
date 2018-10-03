class Queue
  def initialize
    @queue = []
  end

  def enqueue(val)
    @queue.push(val)
  end

  def dequeue
    @queue.shift
  end

  def size
    @queue.size
  end

  def each
    @queue.each { |val| yield(val) }
  end

  def map
    @queue.map { |val| yield(val) }
  end

  def empty?
    @queue.size == 0
  end
end
