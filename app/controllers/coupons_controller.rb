class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coupons }
    end

  end
end
