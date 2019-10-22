class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.string :bill_no
      t.datetime :date
      t.string :payment_mode
      t.string :customer
      t.decimal :total

      t.timestamps
    end
  end
end
