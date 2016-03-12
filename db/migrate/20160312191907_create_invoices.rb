class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :num_ext
      t.string :num_int
      t.string :state
      t.string :city
      t.string :country
      t.string :rfc
      t.string :cp
      t.boolean :favorite, default: false
      t.references :doctor, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
