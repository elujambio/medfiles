class AddGynecologyTemplateIdToContraceptives < ActiveRecord::Migration
  def change
    add_reference :contraceptives, :gynecology_template, index: true, foreign_key: true
  end
end
