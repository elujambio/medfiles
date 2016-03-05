class OphtalmologyTemplate < ActiveRecord::Base
	
	belongs_to :doctor
	has_many :prescriptions,:as => :prescriptable, dependent: :delete_all
	has_many :template_photos, :as => :photable, dependent: :delete_all
	has_many :template_files, :as => :fileable, dependent: :delete_all
	has_many :patients, as: :templatable, dependent: :delete_all
end
