class CreateDoctorPictures < ActiveRecord::Migration
  def change
    create_table :doctor_pictures do |t|
      t.string :picture
      t.references :doctor, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
