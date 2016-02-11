class DoctorPicturesController < ApplicationController
	before_action :set_doctor_picture
	def new 		
		@picture = DoctorPicture.new
	end
	def create
		@picture = DoctorPicture.new(doctor_picture_params)
		@picture.doctor = current_doctor 
		if @picture.save
			flash[:notice] = "Foto guardada."
			redirect_to current_doctor
		else
			flash[:notice] = "Foto no guardada. Vuelve a intentar en un rato."
			render action: "new"
	end
	def edit 
	end
	def update 
		if @picture.update(doctor_picture_params)
			flash[:notice] = "Foto guardada."
			redirect_to current_doctor
		else
			flash[:alert] = "Foto no guardada. Vuelve a intentar en un rato."
			render action: "edit"
		end		
	end
	def destroy 
		@picture.destroy
		flash[:alert] = "Foto eliminada."
		redirect_to current_doctor
	end
	private 
		def set_doctor_picture
			@picture = DoctorPictures.find(params[:id])
			rescue ActiveRecord::RecordNotFound 
			flash[:alert] = "No encontramos la foto que estabas buscando"
			redirect_to root_url
		end
		def doctor_picture_params
			params.require(:doctor_pictures).permit(:picture)
		end


end
