class Plan < ActiveRecord::Base
	belongs_to :doctor
	has_many :plan_elements
  	has_many :template_plan, :through => :plan_elements, :source => :element, :source_type => 'TemplatePlan'
  	has_many :site_plan, :through => :plan_elements, :source => :element, :source_type => 'SitePlan'
end
