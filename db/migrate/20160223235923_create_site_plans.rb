class CreateSitePlans < ActiveRecord::Migration
  def change
    create_table :site_plans do |t|
      t.string :name
      t.text :description
      t.float :annual_cost
      t.belongs_to :plan
      t.timestamps null: false
    end
  end
end
