class AddFieldsToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :site_active, :boolean, default: false
    add_column :doctors, :templates_active, :boolean, default: false
    add_column :doctors, :professional_license, :string
  end
end
