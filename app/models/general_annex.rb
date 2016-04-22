class GeneralAnnex < ActiveRecord::Base
  belongs_to :general_template
  validates :annex, presence: true
end
