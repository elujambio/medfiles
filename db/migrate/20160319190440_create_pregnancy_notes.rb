class CreatePregnancyNotes < ActiveRecord::Migration
  def change
    create_table :pregnancy_notes do |t|
      t.text :note
       t.references :gynecology_template, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
