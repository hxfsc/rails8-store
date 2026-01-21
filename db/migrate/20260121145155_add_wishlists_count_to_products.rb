class AddWishlistsCountToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :wishlist_count, :integer, default: 0
  end
end
