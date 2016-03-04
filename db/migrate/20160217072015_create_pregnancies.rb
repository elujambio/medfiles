class CreatePregnancies < ActiveRecord::Migration
  def change
    create_table :pregnancies do |t|
      t.integer :pregnancy_number
      t.date :pregnancy_date
      t.string :abortion
      t.string :delivery
      t.string :induction
      t.string :ending
      t.string :rn
      t.string :newborn
      t.string :baby_weight
      t.string :baby_sex
      t.string :puerperium

      t.timestamps null: false
    end
  end
end
