class OphtalmologyTemplate < ActiveRecord::Base
	validates :name, :age, :birth_date, :sex, :ocupation, :address, :telephone, :email, presence: true 
end
