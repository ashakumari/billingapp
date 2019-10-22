class CreateBillItems < ActiveRecord::Migration[5.1]
  def change
    create_table :bill_items do |t|
      t.integer :sl_no
      t.string :particulars
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :gst_rate
      t.decimal :amount
      t.references :bill, foreign_key: true

      t.timestamps
    end
  end
end
