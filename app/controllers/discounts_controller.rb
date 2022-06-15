class DiscountsController < ApplicationController
  before_action :find_merchant

  def index
    @discounts = @merchant.discounts
  end

  def new

  end

  def show
    @discount = Discount.find(params[:id])
  end

  def edit
    @discount = Discount.find(params[:id])
  end

  def create
    @merchant.discounts.create!(discount_params)
    redirect_to merchant_discounts_path(@merchant)
  end

  def update
    @discount = Discount.find(params[:id])
    if 0 < params[:discount].to_i && params[:discount].to_i < 100
      @discount.update(discount_params)
      redirect_to merchant_discount_path(@merchant, @discount)
    else
      flash[:message] = 'Please enter a valid number between 0 and 100 for discount and quantity'
      redirect_to edit_merchant_discount_path(@merchant, @discount)
    end
  end

  def destroy
    @discount = Discount.find(params[:id])
    @discount.destroy
    redirect_to merchant_discounts_path(@merchant)
  end

  private
    def discount_params
      params.permit(:discount, :threshold, :merchant_id)
    end
end
