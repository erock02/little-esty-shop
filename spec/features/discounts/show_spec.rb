require 'rails_helper'

RSpec.describe 'merchant discount show', :vcr do
  it 'shows discount information' do
    merchant1 = Merchant.create!(name: "Schroeder-Jerde")
    discount1 = merchant1.discounts.create!(discount: 20, threshold: 10)

    visit "/merchants/#{merchant1.id}/discounts/#{discount1.id}"

    expect(page).to have_content("Discount Information")
    expect(page).to have_content("Discount Quantity Threshold: #{discount1.threshold}")
    expect(page).to have_content("Discount Percentage: #{discount1.discount}")
  end

end
