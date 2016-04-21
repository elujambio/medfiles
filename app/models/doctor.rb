class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :ophtalmology_templates, dependent: :delete_all
  has_many :gynecology_templates, dependent: :delete_all
  has_many :general_templates, dependent: :delete_all

  has_many :doctor_pictures, dependent: :delete_all
  has_many :patients, dependent: :delete_all
  has_many :plans
  has_many :invoices, dependent: :delete_all
end
