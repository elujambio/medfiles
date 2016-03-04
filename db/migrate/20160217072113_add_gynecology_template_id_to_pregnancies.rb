class AddGynecologyTemplateIdToPregnancies < ActiveRecord::Migration
  def change
    add_reference :pregnancies, :gynecology_template, index: true, foreign_key: true
  end
end
