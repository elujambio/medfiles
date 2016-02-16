class GynecologyTemplate < ActiveRecord::Base
	belongs_to :doctor
	before_create :set_register_number
	
	private
		def set_register_number
			total_count = self.doctor.gynecology_templates.count
			self.register = total_count+1
		end
end
