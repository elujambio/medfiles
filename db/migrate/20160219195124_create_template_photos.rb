class CreateTemplatePhotos < ActiveRecord::Migration
  def change
    create_table :template_photos do |t|
      t.string :photo
      t.integer :photable_id
      t.string :photable_type

      t.timestamps null: false
    end
  end
end
