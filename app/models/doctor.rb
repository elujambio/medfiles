class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :ophtalmology_templates, dependent: :delete_all
  has_many :doctor_pictures, dependent: :delete_all
  has_many :patients
end
