class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.string :prescription
     
      t.references :ophtalmology_template, index: true, foreign_key: true
      t.references :gynecology_template, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
