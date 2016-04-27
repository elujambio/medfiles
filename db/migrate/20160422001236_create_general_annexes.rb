class CreateGeneralAnnexes < ActiveRecord::Migration
  def change
    create_table :general_annexes do |t|
      t.text :annex
      t.references :general_template, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
