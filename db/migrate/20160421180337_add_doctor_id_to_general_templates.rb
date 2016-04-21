class AddDoctorIdToGeneralTemplates < ActiveRecord::Migration
  def change
    add_reference :general_templates, :doctor, index: true, foreign_key: true
  end
end
