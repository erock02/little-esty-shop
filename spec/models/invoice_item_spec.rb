require 'rails_helper'

RSpec.describe InvoiceItem do
  describe 'relationships' do
    it { should belong_to(:invoice) }
    it { should belong_to(:item) }
  end

  describe 'validations' do
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:status) }
  end

  describe 'instance methods' do
    it 'can get discount id via applied_discount method' do
    merchant1 = Merchant.create!(name: "Schroeder-Jerde")
    discount1 = merchant1.discounts.create!(discount: 30, threshold: 8)
    discount2 = merchant1.discounts.create!(discount: 15, threshold: 8)
    item2 = merchant1.items.create!(name: "Autem Minima", description: "Cumque consequuntur ad", unit_price: 67076)
    customer1 = Customer.create!(first_name: "Leanne", last_name: "Braun")
    invoice1 = customer1.invoices.create!(status: "in progress")
    invoice_item1 = InvoiceItem.create!(item_id: item2.id, invoice_id: invoice1.id, quantity: 9, unit_price: 23324, status: "packaged")

    expect(invoice_item1.applied_discount.id).to eq(discount1.id)
    end
  end
end
