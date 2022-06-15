class Discount < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :discount, :threshold
end
