class Address < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :postal_code, presence: true, format: {with: /\A\d{3}\d{4}\z/}
  validates :address, presence: true

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
