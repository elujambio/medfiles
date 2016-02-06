class AddEmailToOphtalmologyTemplate < ActiveRecord::Migration
  def change
    add_column :ophtalmology_templates, :email, :string
  end
end
