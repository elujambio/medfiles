class TemplatePhotosController < ApplicationController
	before_action :authenticate_doctor!
	before_action :set_template_photo, only: [:show, :edit, :update, :destroy]
	before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

	def new	
		@template_photo = @photable.template_photos.new
	end
	def create

		@template_photo = @photable.template_photos.new template_photos_params
		
		if @template_photo.save
			flash[:notice] = "Foto guardado."
			redirect_to @photable
		else
			flash[:alert] = "Foto no guardado. Vuelve a intentar en un rato." 
			render action: "new"
		end
	end

	def show
	end

	def edit
		
	end

	def update
		if @template_photo.update(template_photos_params)
			flash[:notice] = "Foto no guardado."
			redirect_to @photable
		else
			flash[:alert] = "Foto no guardado. Vuelve a intentar en un rato." 
			render action: "edit"
		end
	end

	def destroy 
		@template_photo.destroy 
		flash[:notice] = "Foto eliminado."
		redirect_to root_url
	end
	private
		
		def set_template_photo
			@template_photo = TemplatePhoto.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Foto inexistente."
			redirect_to root_url
		end

		def template_photos_params
			params.require(:template_photo).permit(:photo)
		end
		def set_s3_direct_post
    		@s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  		end

end
