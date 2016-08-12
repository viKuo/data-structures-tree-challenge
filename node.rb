class Node
	attr_accessor :value, :children

	def initialize(value)
		@value = value
		@children = []
	end

	def add_child(child)
		@children << child
	end

	def children?
		@children.empty?
	end
end
