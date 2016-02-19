class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.text :prescription
      t.integer :prescriptable_id
      t.string :prescriptable_type

      t.timestamps null: false
    end
  end
end
