require_relative 'tree'
require_relative 'node'

describe Tree do
	let! (:tree) { Tree.new(Node.new("body"))  }
	before (:each) do
		tree.root.children = [Node.new("div"), Node.new("div"), Node.new("div")]
		tree.root.children[1].children = [Node.new("p"), Node.new("p")]
		tree.root.children[1].children[1].children = [Node.new("b")]
	end

	it "can find the node with value 'b' in a tree" do
		expect(tree.search { "b" }.value).to eq "b"
	end

end
