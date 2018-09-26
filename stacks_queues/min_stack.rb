

class MinStack
  Node = Struct.new(:val, :next)

  def push(val)
    @head = Node.new(val, @head)
    @min  = Node.new(val, @min) if !@min || val <= @min.val
  end

  def pop 
    if @head 
      @min  = @min.next if @head.val == @min.val
      @head = @head.next
    end
  end

  def top
    @head&.val
  end

  def get_min
    @min&.val
  end
end # NickJohnson's solution