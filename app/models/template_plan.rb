class TemplatePlan < ActiveRecord::Base
	validates :name, :monthly_cost, :anual_discount, :description, :max_files, presence: true
	before_save :set_annual_cost

	has_one :plan_element, :as =>:element
 	has_one :plan, :through => :plan_elements
	
	private
		def set_annual_cost
			self.anual_cost = (self.monthly_cost * 12) * ( (100 - self.anual_discount)/100 )
		end

end
