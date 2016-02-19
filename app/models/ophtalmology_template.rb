class OphtalmologyTemplate < ActiveRecord::Base
	validates :name, presence: true 
	belongs_to :doctor
	has_many :prescriptions,:as => :prescriptable, dependent: :delete_all
	has_many :template_photos, :as => :photable, dependent: :delete_all
end
