class PlanElement < ActiveRecord::Base

	belongs_to :plan
 	 belongs_to :element, :polymorphic => true
end
