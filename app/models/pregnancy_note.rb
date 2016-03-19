class PregnancyNote < ActiveRecord::Base
	belongs_to :gynecology_template
	validates :note, presence: true
end
