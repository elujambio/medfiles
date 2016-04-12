class GynecologyTemplate < ActiveRecord::Base
	belongs_to :doctor
	has_many :contraceptives, dependent: :delete_all
	accepts_nested_attributes_for :contraceptives, reject_if: proc { |attributes| attributes['name'].blank? }, :allow_destroy => true

	has_many :pregnancies, dependent: :delete_all
	accepts_nested_attributes_for :pregnancies, reject_if: proc { |attributes| attributes['pregnancy_number'].blank? }, :allow_destroy => true
	
	has_many :gynecology_annexes, dependent: :delete_all
	has_many :prescriptions, :as => :prescriptable, dependent: :delete_all
	has_many :template_photos, :as => :photable, dependent: :delete_all
	has_many :template_files, :as => :fileable, dependent: :delete_all
	has_one :patient, as: :templatable, dependent: :delete
	#accepts_nested_attributes_for :patients, reject_if: proc { |attributes| attributes['name'].blank? }, :allow_destroy => true
	
	before_create :set_register_number
	has_many :pregnancy_evolutions
	has_many :pregnancy_notes
	

	def to_s
		name
	end

	private
		def set_register_number
			total_count = self.doctor.gynecology_templates.count
			self.register = total_count+1
		end
end
