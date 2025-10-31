class Order < ApplicationRecord
  belongs_to :user
  belongs_to :shipping_address, class_name: "Address"
  has_many :order_items, dependent: :destroy

  validates :status, inclusion: { in: %w[pending paid shipped delivered] }
end
