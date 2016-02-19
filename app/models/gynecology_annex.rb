class GynecologyAnnex < ActiveRecord::Base
  belongs_to :gynecology_template
  validates :annnex, presence: true
end
