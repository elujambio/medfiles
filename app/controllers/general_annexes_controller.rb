class GeneralAnnexesController < ApplicationController
	before_action :authenticate_doctor!
	before_action :set_general_template
	before_action :set_general_annex, only: [:show, :edit, :update, :destroy]
	before_action :authorize_doctor_template, only: [:new, :create, :edit, :update, :destroy]
	

	def new
		@general_annex = @general_template.general_annexes.build
	end

	def create
		@general_annex = @general_template.general_annexes.build(general_annex_params)
		if @general_annex.save
			redirect_to [@general_template, @general_annex]
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
		if @general_annex.update(general_annex_params)
			redirect_to [@general_template, @general_annex]
		else
			flash[:error] = "Hubo un error, vuelve a intentar."
			render action: "edit"
		end
	end

	def destroy
		@general_annex.destroy
		redirect_to @general_template
	end

	private
		def set_general_template
			@general_template = GeneralTemplate.find(params[:general_template_id])
		end

		def set_general_annex
			@general_annex = @general_template.general_annexes.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Hoja de Evolución inexistente"
		end

		def general_annex_params
			params.require(:general_annex).permit(:annex)
		end

		def authorize_doctor_template
			authenticate_doctor_for_template(@general_template)
		end
end
