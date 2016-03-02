require_relative '../node'

describe Node do
  let(:node) { Node.new(42) }

  describe "when initialized" do
    it "has a value" do
      expect(node.value).to eq 42
    end

    it "has no children" do
      expect(node.children).to be_empty
    end
  end

  describe "adding children" do
    let(:child) { double(:child) }

    it "appends the child to the node's children" do
      node.add_child(child)
      expect(node.children.last).to eq child
    end
  end

  describe "#search" do
    it "matches itself" do
      expect(node.search { |value| value == 42 }).to eq node
    end

    it "searches its children" do
      child = Node.new("child")
      node.add_child(child)
      expect(node.search { |value| value == child.value }).to eq child
    end
  end
end
