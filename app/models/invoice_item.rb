class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item

  validates :quantity, presence: true
  validates :unit_price, presence: true
  validates :status, presence: true

  enum status: {'pending' => 0, 'shipped' => 1, 'packaged' => 2}

  def applied_discount
    Merchant
    .joins(:invoice_items, :discounts)
    .select('discounts.id')
    .where("invoice_items.id = #{self.id} AND invoice_items.quantity >= discounts.threshold")
    .order('discounts.discount DESC')
    .first
  end
end
