class RemoveCurrentFromOphtalmologyTemplates < ActiveRecord::Migration
  def change
    remove_column :ophtalmology_templates, :current, :string
  end
end
