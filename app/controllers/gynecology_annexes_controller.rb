class GynecologyAnnexesController < ApplicationController
	before_action :authenticate_doctor!
	before_action :set_gynecology_template
	before_action :authenticate_doctor_for_gynecology_template!, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_contraceptive, only: [:show, :edit, :update, :destroy]

	def new
		@gynecology_annex = @gynecology_template.gynecology_annexes.build
	end

	def create
		@gynecology_annex = @gynecology_template.gynecology_annexes.build(gynecology_annex_params)
		if @gynecology_annex.save
			redirect_to @gynecology_template
		else
			flash[:error] = "Hubo un error, vuelve a intentar."
			render action: "new"
		end
	end

	def show
	end

	def edit		
	end

	def update
		if @gynecology_annex.update(gynecology_annex_params)
			redirect_to @gynecology_template
		else
			flash[:error] = "Hubo un error, vuelve a intentar."
			render action: "edit"
		end
	end

	def destroy
		@gynecology_annex.destroy
		redirect_to @gynecology_template
	end

	private
		def set_gynecology_template
			@gynecology_template = GynecologyTemplate.find(params[:gynecology_template_id])
		end
		def set_contraceptive
			@gynecology_annex = GynecologyAnnex.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				flash[:alert] = "Hoja de Evolución inexistente."
				redirect_to root_url
		end

		def gynecology_annex_params
			params.require(:gynecology_annex).permit(:annex)
		end
end
