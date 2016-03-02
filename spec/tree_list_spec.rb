require_relative "../tree_list"

describe "TreeList" do
  let(:tree_list) { TreeList.new }

  describe "when empty" do
    it "has size of 0" do
      expect(tree_list.size).to eq 0
    end
  end

  describe "adding items" do
    it "changes the size of the list" do
      expect { tree_list.add(42) }.to change { tree_list.size }.by(1)
    end

    it "can add multiple items" do
      vals = [*1..100]
      expect {
        vals.shuffle.each do |i|
          tree_list.add(i)
        end
      }.to change { tree_list.size }.by(vals.length)
    end
  end

  describe "#each" do
    let(:element) { double(:element) }

    it "yields the element to the block" do
      tree_list.add(element)
      expect { |block| tree_list.each(&block) }.to yield_with_args(element)
    end

    it "yields elements in order" do
      vals = [*1..100]
      vals.shuffle.each do |value|
        tree_list.add(value)
      end
      expect { |block| tree_list.each(&block) }.to yield_successive_args(*vals)
    end
  end

  describe "#index_of" do
    it "returns 0 for the first element in the list" do
      tree_list.add(42)

      expect(tree_list.index_of(42)).to eq 0
    end

    it "returns 100 for the 100th item in the list" do
      vals = [*1..100]
      vals.shuffle.each do |value|
        tree_list.add(value)
      end

      expect(tree_list.index_of(100)).to eq 99
    end
  end

  describe "#contains?" do
    before do
      vals = [*1..100]
      vals.shuffle.each do |value|
        tree_list.add(value)
      end
    end

    it "returns true if the element is found" do
      expect(tree_list.contains?(42)).to be_true
    end

    it "returns false if the element is not found" do
      expect(tree_list.contains?(1000)).to be_false
    end
  end
end

