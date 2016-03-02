require_relative "node"

class BinaryNode < Node
  def initialize(value)
    super

    @children = [nil, nil]
  end

  def left_child
    self.children[0]
  end

  def left_child=(node)
    self.children[0] = node
  end

  def right_child
    self.children[1]
  end

  def right_child=(node)
    self.children[1] = node
  end

  def each(&block)
    left_child.each(&block) if left_child
    block.call(self.value)
    right_child.each(&block) if right_child
  end

  def contains?(element)
    case(element <=> self.value)
    when 0
      true
    when 1
      right_child ? right_child.contains?(element) : false
    else
      left_child ? left_child.contains?(element) : false
    end
  end

  def add_child(child)
    if (child.value <=> self.value) >= 0
      if right_child
        right_child.add_child(child)
      else
        self.right_child = child
      end
    else
      if left_child
        left_child.add_child(child)
      else
        self.left_child = child
      end
    end
  end
end
