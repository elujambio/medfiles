class GynecologyTemplate < ActiveRecord::Base
	belongs_to :doctor
	has_many :contraceptives, dependent: :delete_all
	accepts_nested_attributes_for :contraceptives, reject_if: proc { |attributes| attributes['name'].blank? }, :allow_destroy => true

	has_many :pregnancies, dependent: :delete_all
	accepts_nested_attributes_for :pregnancies, :allow_destroy => true
	
	before_create :set_register_number
	
	validates :name, presence: true

	def to_s
		name
	end

	private
		def set_register_number
			total_count = self.doctor.gynecology_templates.count
			self.register = total_count+1
		end
end