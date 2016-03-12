class AddActiveToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :active, :integer, default: 0
  end
end
