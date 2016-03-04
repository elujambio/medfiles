class DoctorsController < ApplicationController
	has_many :patients
	def show
		@doctor =  Doctor.find(params[:id])

		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "No encontramos lo que buscabas"
			redirect_to root_url
	end
end
