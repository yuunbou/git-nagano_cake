class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { awaiting_payment: 0, confirm: 1, produce: 2, prepare: 3, shipped: 4 }
end
