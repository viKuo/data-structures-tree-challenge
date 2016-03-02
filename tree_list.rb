require_relative "binary_node"
require_relative "tree"

class TreeList
  def initialize
    @size = 0
    @tree = Tree.new
  end

  def size
    @size
  end

  def add(element)
    node = BinaryNode.new(element)
    if @tree.root
      @tree.root.add_child(node)
    else
      @tree.root = node
    end
    @size += 1
  end

  def each(&block)
    @tree.root.each(&block) if @tree.root
    nil
  end

  def index_of(element)
    index = 0
    each do |value|
      return index if value == element
      index += 1
    end
    return nil
  end

  def contains?(element)
    return false unless @tree.root
    @tree.root.contains?(element)
  end
end
