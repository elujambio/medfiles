class Prescription < ActiveRecord::Base
	belongs_to :prescriptable, :polymorphic => true
end
