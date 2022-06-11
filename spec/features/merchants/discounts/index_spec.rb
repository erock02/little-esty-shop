require 'rails_helper'

RSpec.describe 'merchant discount index' do
  it 'shows all discounts' do
    merchant1 = Merchant.create!(name: "Schroeder-Jerde")
    merchant2 = Merchant.create!(name: "Klein, Rempel and Jones")
    merchant1.discounts.create!(discount: 20, threshold: 10)
    merchant1.discounts.create!(discount: 10, threshold: 5)
    merchant2.discounts.create!(discount: 5, threshold: 5)

    visit "/merchants/#{merchant1.id}/discounts"

    expect(page).to have_content("Buy 10, get 20% off")
    expect(page).to have_content("Buy 5, get 10% off")
    expect(page).to_not have_content("Buy 5, get 5% off")

    visit "/merchants/#{merchant2.id}/discounts"
    expect(page).to have_content("Buy 5, get 5% off")
    expect(page).to_not have_content("Buy 10, get 20% off")
  end
end
