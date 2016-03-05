class Patient < ActiveRecord::Base
	belongs_to :doctor
	belongs_to :templatable, polymorphic: true
end
