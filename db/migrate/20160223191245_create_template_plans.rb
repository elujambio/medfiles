class CreateTemplatePlans < ActiveRecord::Migration
  def change
    create_table :template_plans do |t|
      t.string :name
      t.float :monthly_cost
      t.float :anual_discount
      t.float :anual_cost
      t.text :description
      t.integer :max_files

      t.timestamps null: false
    end
  end
end
