class SitePlan < ActiveRecord::Base

	has_one :plan_element, :as =>:element
  	has_one :plan, :through => :plan_elements
end
