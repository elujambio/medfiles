class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.date :birth_date
      t.string :sex
      t.string :originary_from
      t.string :ocupation
      t.string :religion
      t.string :address
      t.string :telephone
      t.string :email
      t.string :insurance_company
      t.string :insurance_policy

      t.timestamps null: false
    end
  end
end
