class BillItemsController < ApplicationController
   before_action :set_bill

  def create
    @bill_item = @bill.bill_items.create(bill_item_params)
 	redirect_to @bill
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:bill_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_item_params
      params.require(:bill_item).permit(:sl_no, :particulars, :quantity, :unit_price, :gst_rate, :amount)
    end
end
