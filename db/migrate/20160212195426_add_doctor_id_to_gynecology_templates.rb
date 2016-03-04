class AddDoctorIdToGynecologyTemplates < ActiveRecord::Migration
  def change
    add_reference :gynecology_templates, :doctor, index: true, foreign_key: true
  end
end
