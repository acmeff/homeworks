require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :name => 'yoyo') }
  subject(:pie) {Dessert.new("pie", 3, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(pie.type).to eq("pie")
    end

    it "sets a quantity" do
      expect(pie.quantity).to eq(3)
    end

    it "starts ingredients as an empty array" do
      expect(pie.ingredients).to be_empty
    end

    context "with a non-integer quantity" do
      subject(:pie) {Dessert.new("pie", '3', "yoyo")}
        it "raises an argument error when given a non-integer quantity" do
          expect{pie.new}.to raise_error(ArgumentError)
        end
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(pie.ingredients).to be_empty
      pie.add_ingredient("berries")
      expect(pie.ingredients).to include("berries")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(pie.ingredients).to receive(:shuffle!)
      pie.mix!
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      pie.eat(1)
      expect(pie.quantity).to eq(2)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { pie.eat(4) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef yoyo has made 3 pies!")
      expect(pie.serve).to include("Chef yoyo")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(pie)
      pie.make_more
    end
  end
end
