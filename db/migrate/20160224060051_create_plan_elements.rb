class CreatePlanElements < ActiveRecord::Migration
  def change
    create_table :plan_elements do |t|
      t.belongs_to :plan, index: true
      t.integer :element_id
      t.string :element_type

      t.timestamps null: false
    end
    add_foreign_key :plan_elements, :plans
    add_foreign_key :plan_elements, :elements
  end
end
