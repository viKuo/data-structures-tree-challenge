require_relative '../tree'

describe Tree do

  describe "when initialized" do
    let(:tree) { Tree.new(node) }
    let(:node) { double(:node) }
    it "has a root" do
      expect(tree.root).to eq node
    end
  end

  describe "#search" do
    let(:tree) { Tree.new(body) }
    let(:body) { Node.new("body") }
    let(:div1) { Node.new("div") }
    let(:div2) { Node.new("div") }
    let(:div3) { Node.new("div") }
    let(:p1) { Node.new("p") }
    let(:p2) { Node.new("p") }
    let(:b1) { Node.new("b") }

    before do
      body.add_child(div1)
      body.add_child(div2)
      body.add_child(div3)

      div2.add_child(p1)
      div2.add_child(p2)

      p2.add_child(b1)
    end

    context "when looking for the root node" do
      it "returns the root node" do
        expect(tree.search { |value| value == "body" }).to eq body
      end
    end

    context "when looking for a second level node" do
      it "returns that node" do
        expect(tree.search { |value| value == "div" }).to eq div1
      end
    end

    context "when looking for a third level node" do
      it "returns that node" do
        expect(tree.search { |value| value == "p" }).to eq p1
      end
    end

    context "when looking for a fourth level node" do
      it "returns that node" do
        expect(tree.search { |value| value == "b" }).to eq b1
      end
    end
  end
end
