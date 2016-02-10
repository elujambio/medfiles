class AddDoctorIdToOphtalmologyTemplates < ActiveRecord::Migration
  def change
    add_reference :ophtalmology_templates, :doctor, index: true, foreign_key: true
  end
end
