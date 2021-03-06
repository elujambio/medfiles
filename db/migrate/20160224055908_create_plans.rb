class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.date :valid_til
      t.date :valid_from
      t.date :grace_til
      t.string :billing_frequency
      t.string :billing_preference
      t.references :doctor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
