require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Garry") }
  let(:cake) { Dessert.new('cakes', 4, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq('cakes')
    end

    it "sets a quantity" do
      expect(cake.quantity).to be(4)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('cake', 'a few', 4) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient('eggs')
      expect(cake.ingredients).to include("eggs")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["chocolate", "flour", "egg", "sugar", "butter"]

      ingredients.each do |ingredient|
        cake.add_ingredient(ingredient)
      end

      expect(cake.ingredients).to eq(ingredients)
      cake.mix!
      expect(cake.ingredients).not_to eq(ingredients)
      expect(cake.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cake.eat(1)
      expect(cake.quantity).to eq(3)
    end

    it "raises an error if the amount is greater than the quantity"
      # expect { cake.eat(1) }.to raise_error("not enough left!") ## Raises an error, why?
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to_receive(:titleize).and_return("Chef Garry the Great Baker")
      expect(cake.serve).to eq("Chef Garry the Great Baker has made 4 cake!".titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to_receive(:bake).with(cake)
      cake.make_more
    end
  end
end
