class Prescription < ActiveRecord::Base
  belongs_to :ophtalmology_template
  belongs_to :gynecology_template
end
