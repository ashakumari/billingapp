require 'humanize'

class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.all
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
    @taxable_amount_for_28_percent = @bill.bill_items.where(gst_rate: 28).sum(:amount) / 1.28
    @taxable_amount_for_18_percent = @bill.bill_items.where(gst_rate: 18).sum(:amount) / 1.18
  end

  # GET /bills/new
  def new
    @bill = Bill.new

    bill_prefix = BillingApp::BillMetaInfo::BillNo_Prefix
    bill_number_size = BillingApp::BillMetaInfo::BillNo_Size

    last_bill_record = Bill.last
    last_bill_no = last_bill_record.bill_no
    last_bill_no_without_prefix = last_bill_no.sub(bill_prefix, ‘’).to_i


    next_bill_no_without_prefix = last_bill_no_without_prefix + 1
    @next_bill_no = bill_prefix + next_bill_no_without_prefix.to_s.rjust(bill_number_size, '0')
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = Bill.new(bill_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:bill_no, :date, :payment_mode, :customer, :total)
    end
end
