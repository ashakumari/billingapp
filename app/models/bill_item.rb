class BillItem < ApplicationRecord
  belongs_to :bill

  before_save :calculate_amount
  after_save :calculate_bill_total
  after_destroy :calculate_bill_total

  validates :sl_no, :particulars, :quantity, :unit_price, presence: true
  validates :particulars, length: { maximum: 200 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10000 }
  validates :unit_price, numericality: { greater_than: 0, less_than_or_equal_to: 10000 }

  def calculate_amount
  	self.amount = self.quantity * self.unit_price
  end

  def calculate_bill_total
  	bill = self.bill
  	bill.total = bill.bill_items.sum(:amount)
  	bill.save!
  end
  
end
