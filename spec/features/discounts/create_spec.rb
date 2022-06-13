require 'rails_helper'

RSpec.describe 'discounts create page', :vcr do
  it 'can create a new discount given valid data' do
    merchant1 = Merchant.create!(name: "Schroeder-Jerde")
    visit "/merchants/#{merchant1.id}/discounts"
    expect(page).to_not have_content("Buy 30 items, get 40% off")

    click_link("Create New Discount")

    expect(current_path).to eq(new_merchant_discount_path(merchant1))
    fill_in 'discount', with: "40"
    fill_in 'threshold', with: "30"
    click_button
    expect(current_path).to eq("/merchants/#{merchant1.id}/discounts")
    expect(page).to have_content("Buy 30 items, get 40% off")
  end
end
