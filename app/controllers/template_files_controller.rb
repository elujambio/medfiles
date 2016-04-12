class TemplateFilesController < ApplicationController
	before_action :authenticate_doctor!
	before_action :set_template_file, only: [:show, :edit, :update, :destroy]
	before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

	def new	
		@template_file = @fileable.template_files.new
	end
	def create

		@template_file = @fileable.template_files.new template_files_params
		
		if @template_file.save
			flash[:notice] = "Archivo guardado."
			redirect_to @fileable
		else
			flash[:alert] = "Archivo no guardado. Vuelve a intentar en un rato." 
			render action: "new"
		end
	end

	def show
	end

	def edit
		
	end

	def update
		if @template_file.update(template_files_params)
			flash[:notice] = "Archivo no guardado."
			redirect_to @fileable
		else
			flash[:alert] = "Archivo no guardado. Vuelve a intentar en un rato." 
			render action: "edit"
		end
	end

	def destroy 
		@template_file.destroy 
		flash[:notice] = "Archivo eliminado."
		redirect_to root_url
	end
	private
		
		def set_template_file
			@template_file = TemplateFile.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Archivo inexistente."
			redirect_to root_url
		end

		def template_files_params
			params.require(:template_file).permit(:asset)
		end

		def set_s3_direct_post
    		@s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  		end
end
