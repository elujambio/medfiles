class AddMoreFieldsToDoctors < ActiveRecord::Migration
  def change
   
    add_column :doctors, :templates_active_medium, :boolean, default: false
    add_column :doctors, :templates_active_big, :boolean, default: false
    add_column :doctors, :templates_active_personalized, :boolean, default: false
    add_column :doctors, :max_files, :integer, default: 0
    add_column :doctors, :site_active_from, :date
    add_column :doctors, :templates_active_from, :date
    add_column :doctors, :templates_active_medium_from, :date
    add_column :doctors, :templates_active_big_from, :date
    add_column :doctors, :templates_active_personalized_from, :date
  end
end
