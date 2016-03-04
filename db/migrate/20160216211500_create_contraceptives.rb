class CreateContraceptives < ActiveRecord::Migration
  def change
    create_table :contraceptives do |t|
      t.string :name
      t.string :time
      t.string :tolerance

      t.timestamps null: false
    end
  end
end
