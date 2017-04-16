require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:larry) {Chef.new("Larry")}
  let(:cake) {Dessert.new('cake', 10, larry)}

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq('cake')
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to be_empty
    end


    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('cake', 'a lot', larry) }.to raise_error(ArgumentError) {'What?'}
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient("chocolate")
      expect(cake.ingredients).to include("chocolate")
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
      cake.eat(2)
      expect(cake.quantity).to eq(8)
    end


    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(12) }.to raise_error { "not enough left!" }
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      cake.serve
      allow(larry).to receive(:titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(larry).to receive(:bake).with(cake)
    end
  end

end
