class Tree
	attr_accessor :root

	def initialize(node) 
		@root = node
	end

	def search
		search_list = [@root]
		until search_list.empty? do
			node = search_list.pop
			if node.value == yield
				return node
			end
			search_list += node.children
		end
		nil
	end
end
