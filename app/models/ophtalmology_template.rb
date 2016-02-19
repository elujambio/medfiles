class OphtalmologyTemplate < ActiveRecord::Base
	#validates :name, :age, :birth_date, :sex, :ocupation, :address, :telephone, :email, presence: true 
	belongs_to :doctor
	has_many :prescriptions,:as => :prescriptable, dependent: :delete_all
end
