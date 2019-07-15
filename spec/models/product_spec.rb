require 'rails_helper'

RSpec.describe Product, type: :model do

    before(:each) do
      @category = Category.create(name: 'Shoes')
      @product = Product.create(name: 'Boots', price_cents: 10000, quantity: 10, category: @category)
    end
      
    describe 'Validations' do

        it "can be saved if all fields are present" do
          @product.save

          expect(@product).to be_valid
          puts @product.errors.full_messages 
        end

        # validation tests/examples here
        it "is not valid without a name" do
          @product.name = nil
      
          expect(@product).to_not be_valid
          puts @product.errors.full_messages 
        end

        it "is not valid without a price" do
          @product.price_cents = nil
      
          expect(@product).to_not be_valid
          puts @product.errors.full_messages 
        end

        it "is not valid without a quantity" do
          @product.quantity = nil
      
          expect(@product).to_not be_valid
          puts @product.errors.full_messages 
        end

        it "is not valid without a category" do
          @product.category = nil;
          
          expect(@product).to_not be_valid
          # expect(@product.errors.full_messages).to include "Category can't be blank"     \
          puts @product.errors.full_messages   
          
        end

        

  end
end
