class ReportsController < ApplicationController
	
	def index
		
		start_date = Date.current
		end_date = Date.current

		if params[:start_date].present?
			start_date = params[:start_date]
		end

		if params[:end_date].present?
			end_date = params[:end_date]
		end

		start_date = Time.parse("#{start_date} 00:00:00").getutc
		end_date = Time.parse("#{end_date} 23:59:59").getutc

		date_filter_criteria = "bills.date BETWEEN '#{start_date}' AND '#{end_date}'"

		filter_criteria_28_gst_cash = "bills.payment_mode = 'Cash' AND bill_items.gst_rate = 28" + " AND " + date_filter_criteria
		filter_criteria_28_gst_credit = "bills.payment_mode = 'Bank' AND bill_items.gst_rate = 28" + " AND " + date_filter_criteria

		filter_criteria_18_gst_cash = "bills.payment_mode = 'Cash' AND bill_items.gst_rate = 18" + " AND " + date_filter_criteria
		filter_criteria_18_gst_credit = "bills.payment_mode = 'Bank' AND bill_items.gst_rate = 18" + " AND " + date_filter_criteria

		@bills_28_percent_gst_cash_payment = Bill.joins(:bill_items).where(filter_criteria_28_gst_cash).select("bills.*, sum(bill_items.amount) / 1.28 as total_taxable_amount").group("bills.id").order("bills.id")
		@bills_28_percent_gst_credit_payment = Bill.joins(:bill_items).where(filter_criteria_28_gst_credit).select("bills.*, sum(bill_items.amount) / 1.28 as total_taxable_amount").group("bills.id").order("bills.id")

		@bills_18_percent_gst_cash_payment = Bill.joins(:bill_items).where(filter_criteria_18_gst_cash).select("bills.*, sum(bill_items.amount) / 1.18 as total_taxable_amount").group("bills.id").order("bills.id")
		@bills_18_percent_gst_credit_payment = Bill.joins(:bill_items).where(filter_criteria_18_gst_credit).select("bills.*, sum(bill_items.amount) / 1.18 as total_taxable_amount").group("bills.id").order("bills.id")
  	
  	end
end