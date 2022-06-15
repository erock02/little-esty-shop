require 'rails_helper'

RSpec.describe 'merchant discount show', :vcr do
  it 'displays form with discount attributes' do
    merchant1 = Merchant.create!(name: "Schroeder-Jerde")
    discount1 = merchant1.discounts.create!(discount: 20, threshold: 10)

    visit edit_merchant_discount_path(merchant1, discount1)

    expect(find_field('discount').value).to eq('20')
    expect(find_field('threshold').value).to eq('10')
  end

  it "can fill in form, submit, and redirect to the discount's show page with updated info", :vcr do
    merchant1 = Merchant.create!(name: "Schroeder-Jerde")
    discount1 = merchant1.discounts.create!(discount: 20, threshold: 10)

    visit edit_merchant_discount_path(merchant1, discount1)

    fill_in 'discount', with: 30
    fill_in 'threshold', with: 25

    click_button "Update"

    expect(current_path).to eq(merchant_discount_path(merchant1, discount1))

    expect(page).to have_content("Discount Quantity Threshold: 25")
    expect(page).to have_content("Discount Percentage: 30")

  end
end
