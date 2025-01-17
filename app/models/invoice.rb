class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items

  validates :status, presence: true

  enum status: {'cancelled' => 0, 'in progress' => 1, 'completed' => 2}

  def invoice_customer
    "#{customer.first_name} #{customer.last_name}"
  end

  def total_revenue
    invoice_items.sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def total_discounted_revenue
    discount_amount = invoice_items
    .joins(item: [merchant: :discounts])
    .select("invoice_items.*, MAX(discounts.discount)")
    .where("invoice_items.quantity >= discounts.threshold")
    .sum('invoice_items.unit_price * invoice_items.quantity * discounts.discount/100')

    total_revenue - discount_amount
  end

  def self.incomplete_invoices
    joins(:invoice_items)
    .where.not(invoice_items: {status: 1})
    .distinct
    .order(:created_at)
  end

  def self.invoices_with_merchant_items(merchant)
    merchant.invoices.distinct(:id)
  end
end
