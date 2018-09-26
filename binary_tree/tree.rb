TreeNode = Struct.new(:val, :left, :right) do 
  def height
    self ? 1 + [left&.height || 0, right&.height || 0].max : 0
  end

  def print_level(level, orig_level, levels = [])
    return levels unless self
    if level == 1 
      levels[orig_level] ||= []
      levels[orig_level] << val
    else
      left&.print_level(level - 1, orig_level, levels)
      right&.print_level(level - 1, orig_level, levels)
    end
    levels
  end

  def to_s
    levels = []
    (1..height + 1).each do |level|
      levels += [print_level(level, level)]
    end
    levels = levels.flat_map { |level| level.reject(&:nil?) }
    levels = levels.map { |level| level.map { |val| val || '_' } }
    levels.each_with_index do |nodes, i|
      puts "#{' ' * ((levels.size - i) * 2)}#{nodes.join(' ' * (levels.size - i))}"
    end
  end

  def self.treeify(arr)
    root = TreeNode.new(arr.shift)
    queue = [root]
    until arr.empty?
      node = queue.shift
      node.left  = TreeNode.new(arr.shift)
      node.right = TreeNode.new(arr.shift)
      queue.push(node.left, node.right)
    end
    root
  end
end