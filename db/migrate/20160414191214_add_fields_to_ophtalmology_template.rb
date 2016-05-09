class AddFieldsToOphtalmologyTemplate < ActiveRecord::Migration
  def change
  	    add_column :ophtalmology_templates, :goinoscopy_left, :text, default: ""
  	    add_column :ophtalmology_templates, :goinoscopy_right, :text, default: ""
  	    add_column :ophtalmology_templates, :macula_left, :text, default: ""
  	    add_column :ophtalmology_templates, :macula_right, :text, default: ""
  end
end
