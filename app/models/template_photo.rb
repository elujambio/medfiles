class TemplatePhoto < ActiveRecord::Base
	belongs_to :photable, polymorphic: true
end
