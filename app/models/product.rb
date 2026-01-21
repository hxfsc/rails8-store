class Product < ApplicationRecord
  has_many :subscribers, dependent: :destroy
  has_many :wishlist_products, dependent: :destroy
  has_many :wishlists, through: :wishlist_products



  has_one_attached :featured_image
  has_rich_text :description
  validates :name, presence: { message: "商品名称不能为空"}


  after_update_commit :notify_subscribers, if: :back_in_stock?

  def back_in_stock?
    inventory_count_previously_was.zero? && inventory_count.positive?
  end

  def notify_subscribers
    subscribers.each do |subscriber|
      ProductMailer.with(product: self, subscriber: subscriber).in_stock.deliver_later
    end
  end


end
