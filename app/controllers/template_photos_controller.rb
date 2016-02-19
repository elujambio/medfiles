class TemplatePhotosController < ApplicationController
	before_action :authenticate_doctor!
	before_action :set_prescription, only: [:show, :edit, :update, :destroy]

	def new	
	end
	def create

		@template_photo = @photable.template_photos.new template_photos_params
		
		if @template_photo.save
			flash[:notice] = "Receta guardada."
			redirect_to @photable
		else
			flash[:alert] = "Receta no guardada. Vuelve a intentar en un rato." 
			render action: "new"
		end
	end

	def show
	end

	def edit
		
	end

	def update
		if @template_photo.update(template_photos_params)
			flash[:notice] = "Receta no guardada."
			redirect_to @photable
		else
			flash[:alert] = "Receta no guardada. Vuelve a intentar en un rato." 
			render action: "edit"
		end
	end

	def destroy 
		@template_photo.destroy 
		flash[:notice] = "Receta eliminada."
		redirect_to root_url
	end
	private
		
		def set_prescription
			@template_photo = TemplatePhoto.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Receta inexistente."
			redirect_to root_url
		end

		def template_photos_params
			params.require(:template_photo).permit(:photo)
		end

end
