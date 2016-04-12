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
      t.integer :templatable_id
      t.string  :templatable_type
      t.timestamps null: false
    end
    add_index :patients, :templatable_id
  end
end
