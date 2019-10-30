class Bill < ApplicationRecord
	has_many :bill_items

	validates :bill_no, presence: true
	validates :bill_no, uniqueness: true
end
