class Address < ApplicationRecord
  belongs_to :user
  has_many :orders, foreign_key: :shipping_address_id

  validates :street, :city, :province, :postal_code, :country, :address_type, presence: true
end
