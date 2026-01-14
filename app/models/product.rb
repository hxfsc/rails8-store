class Product < ApplicationRecord
  validates :name, presence: { message: "商品名称不能为空"}
end
