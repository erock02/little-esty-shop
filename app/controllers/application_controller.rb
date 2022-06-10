class ApplicationController < ActionController::Base
  before_action :holidays_info, only: [:index, :show, :new, :edit]

  def find_merchant
    @merchant = Merchant.find(params[:merchant_id])
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def holidays_info
    @holidays = HolidayFacade.create_holidays_or_error
  end

end
