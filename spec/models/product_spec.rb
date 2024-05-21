require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    let(:category) { Category.create(name: 'Sample Category', id: 11) }

    it "is valid with all fields filled" do
      product = Product.new(
        name: 'Sample Product', 
        category: category,
        id: '111',
        description: 'test description',
        image: 'test',
        price_cents: 100,
        quantity: 10,
        category_id: 11
        )
      expect(product).to be_valid
    end

    it "is not valid without a price" do
      product = Product.new(
        name: "Sample", 
        category: category,
        id: '111',
        description: 'test description',
        image: 'test',
        price_cents: nil,
        quantity: 10,
        category_id: 11
        )
      expect(product).to be_invalid
    end

    it "is not valid without a quantity" do
      product = Product.new(
        name: 'Sample', 
        category: category,
        id: '111',
        description: 'test description',
        image: 'test',
        price_cents: 100,
        quantity: nil,
        category_id: 11
        )
      expect(product).to be_invalid
    end

    it "is not valid without a category" do
      product = Product.new(
        name: 'Sample', 
        category: nil,
        id: '111',
        description: 'test description',
        image: 'test',
        price_cents: 100,
        quantity: 10,
        category_id: 11
        )
      expect(product).to be_invalid
    end

    it "is not valid without a name" do
      product = Product.new(
        name: nil, 
        category: category,
        id: '111',
        description: 'test description',
        image: 'test',
        price_cents: 100,
        quantity: 10,
        category_id: 11
        )
      expect(product).to be_invalid
    end

  end
end
