class CreateGynecologyAnnexes < ActiveRecord::Migration
  def change
    create_table :gynecology_annexes do |t|
      t.text :annex
      t.references :gynecology_template, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
