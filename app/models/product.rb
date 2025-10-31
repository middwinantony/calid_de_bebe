class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :order_items
  has_many_attached :images

  validates :title, :price, :condition, presence: true
  # validates :status, inclusion: { in: %w[available sold reserved] }
end
