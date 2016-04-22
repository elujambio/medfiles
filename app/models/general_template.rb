class GeneralTemplate < ActiveRecord::Base
	belongs_to :doctor

	has_one :patient, as: :templatable, dependent: :delete
	has_many :prescriptions, :as => :prescriptable, dependent: :delete_all
	has_many :template_photos, :as => :photable, dependent: :delete_all
	has_many :template_files, :as => :fileable, dependent: :delete_all
	has_many :gynecology_annexes, dependent: :delete_all
	
	before_create :set_register_number

	
	private
		def set_register_number
			total_count = self.doctor.gynecology_templates.count
			self.register = total_count+1
		end
end
