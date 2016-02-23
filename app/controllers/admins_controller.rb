class AdminsController < ApplicationController
	before_action :authenticate_admin!
	def admin_panel
	end

	def all_gynecologists
		@gynecologists = Doctor.where(speciality: "Ginecología").paginate(page: params[:page], per_page: 20)
	end

	def all_ophthalmologists
		@ophthalmologists = Doctor.where(speciality: "Oftalmología").paginate(page: params[:page], per_page: 20)
	end

	def show_doctor
		@doctor =  Doctor.find(params[:format])

		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "No encontramos lo que buscabas"
			redirect_to root_url
	end
end