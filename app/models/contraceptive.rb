class Contraceptive < ActiveRecord::Base
	belongs_to :gynecology_templates

	validates :name, presence: true

	def to_s
		name
	end
end
