class SubscribersController < ApplicationController


  allow_unauthenticated_access
  before_action :set_product
  def create
    @product.subscribers.where(subscriber_params).first_or_create
    redirect_to @product, notice: "订阅成功"
  end


  private

  def set_product
    @product = Product.find(params[:product_id])
  end


  def subscriber_params
    params.expect(subscriber:%w[email])
  end
end
