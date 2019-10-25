class ReportsController < ApplicationController
	
	def index
		# if params[:search].blank?
			
		# else

		start_date = Date.today - 2
		end_date = Date.today

			date_filter_criteria = "bills.date BETWEEN '#{start_date}' AND '#{end_date}'"

			filter_criteria_28_gst_cash = "bills.payment_mode = 'Cash' AND bill_items.gst_rate = 28" + " AND " + date_filter_criteria
			filter_criteria_28_gst_credit = "bills.payment_mode = 'Credit' AND bill_items.gst_rate = 28" + " AND " + date_filter_criteria
			
			filter_criteria_18_gst_cash = "bills.payment_mode = 'Cash' AND bill_items.gst_rate = 18" + " AND " + date_filter_criteria
			filter_criteria_18_gst_credit = "bills.payment_mode = 'Credit' AND bill_items.gst_rate = 18" + " AND " + date_filter_criteria

			@bills_28_percent_gst_cash_payment = Bill.joins(:bill_items).where(filter_criteria_28_gst_cash).select("bills.*, sum(bill_items.amount) / 1.28 as total_taxable_amount").group("bill_id")
			@bills_28_percent_gst_credit_payment = Bill.joins(:bill_items).where(filter_criteria_28_gst_credit).select("bills.*, sum(bill_items.amount) / 1.28 as total_taxable_amount").group("bill_id")

			@bills_18_percent_gst_cash_payment = Bill.joins(:bill_items).where(filter_criteria_18_gst_cash).select("bills.*, sum(bill_items.amount) / 1.18 as total_taxable_amount").group("bill_id")
			@bills_18_percent_gst_credit_payment = Bill.joins(:bill_items).where(filter_criteria_18_gst_credit).select("bills.*, sum(bill_items.amount) / 1.18 as total_taxable_amount").group("bill_id")
			
			# @bill.bill_items.where(gst_rate: 28).sum(:amount) / 1.28
			# select bills.*, sum(bill_items.amount) as total_amount from bills inner join bill_items on bills.id = bill_items.bill_id 
			# and bills.payment_mode='Cash' and bill_items.gst_rate=18 group by bills.id;
		# end  	
  	end
end