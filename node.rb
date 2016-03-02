class Node

  attr_reader :value, :children

  def initialize(value)
    @value = value
    @children = []
  end

  def add_child(child)
    @children << child
  end

  def search(&block)
    return self if block.call(value)

    children.each do |child|
      result = child.search(&block)
      return result if result
    end

    nil
  end
end
