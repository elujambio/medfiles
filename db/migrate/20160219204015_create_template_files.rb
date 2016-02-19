class CreateTemplateFiles < ActiveRecord::Migration
  def change
    create_table :template_files do |t|
      t.string :asset
      t.integer :fileable_id
      t.string :fileable_type

      t.timestamps null: false
    end
  end
end
