require 'rails_helper'

RSpec.feature "users can navigate to the home page and add an item to cart", type: :feature, js: true do

  # SETUP


  before(:each) do
    @user = User.create(
      email: 'test@test.com',
      first_name: 'test',
      last_name: 'test',
      password: 'password',
      password_confirmation: 'password'
    )

    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "add to cart" do
    visit login_path
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password'
    click_button 'Submit'
    
    first('article.product').find_button('Add').click

    save_screenshot "add-to-cart.png"
    
    expect(page).to have_content 'My Cart (1)'
    # puts page.html
  end
end