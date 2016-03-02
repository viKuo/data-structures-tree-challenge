class Tree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  def search(&block)
    root.search(&block) if root
  end
end
