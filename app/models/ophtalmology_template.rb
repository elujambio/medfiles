class OphtalmologyTemplate < ActiveRecord::Base
	validates :name, :age, :birth_date, :sex, :occupation, :address, :telephone, :email, presence: true 
end
