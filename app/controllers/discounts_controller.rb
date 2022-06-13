class DiscountsController < ApplicationController
  before_action :find_merchant

  def index
    @discounts = @merchant.discounts
  end

  def new

  end

  def create
    @merchant.discounts.create!(discount_params)
    redirect_to merchant_discounts_path(@merchant)
  end

  private
    def discount_params
      params.permit(:discount, :threshold, :merchant_id)
    end
end
