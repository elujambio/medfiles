class CreatePregnancyEvolutions < ActiveRecord::Migration
  def change
    create_table :pregnancy_evolutions do |t|
      t.date :day
      t.integer :weeks_with_amenorrhea
      t.string :blood_pressure
      t.string :edema
      t.string :uterus_bottom
      t.string :fetal_heartbeat
      t.string :fetal_movements
      t.string :presentation
      t.string :pain
      t.string :genital_bleeding
      t.string :headache
      t.string :visual_hearing
      t.string :vomit
      t.string :urinales
      t.string :intestinal
      t.string :hb_htc
      t.string :glycemia
      t.string :albuminuria
      t.string :genital_exp
      t.text :treatment
      t.references :gynecology_template, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
