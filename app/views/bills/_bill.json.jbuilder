json.extract! bill, :id, :bill_no, :date, :payment_mode, :customer, :total, :created_at, :updated_at
json.url bill_url(bill, format: :json)
