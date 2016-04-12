class CreateLabors < ActiveRecord::Migration
  def change
    create_table :labors do |t|
      t.date :labor_init
      t.string :labor_init_at
      t.date :fetal_labor
      t.string :fetal_labor_at
      t.string :delivery
      t.string :first_period_duration
      t.string :expulsive
      t.string :third_period_duration
      t.string :type_of_labor
      t.string :rupture_of_membranes
      t.text :meds
      t.string :presentation_and_position
      t.string :type_of_labor
      t.boolean :forceps, default: false
      t.text :obstetric_indications
      t.boolean :perineal_tear, default: false
      t.boolean :cervical_tear, default: false
      t.string :steamimmediate_postpartum_period
      t.string :sex
      t.string :weight
      t.string :complications
      t.string :anesthetist
      t.string :pediatrician

      t.timestamps null: false
    end
  end
end
