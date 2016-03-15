class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :next_payment
      t.boolean :accepted_payment
      t.integer :payment_number, default: 0
      t.references :plan, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
