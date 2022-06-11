class DiscountsController < ApplicationController
  before_action :find_merchant

  def index
    @discounts = @merchant.discounts
  end
end
