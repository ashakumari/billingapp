class BillItem < ApplicationRecord
  belongs_to :bill

  validates :sl_no, :particulars, :quantity, :unit_price, presence: true
  validates :particulars, length: { maximum: 200 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10000 }
  validates :unit_price, numericality: { greater_than: 0, less_than_or_equal_to: 10000 } 
end
