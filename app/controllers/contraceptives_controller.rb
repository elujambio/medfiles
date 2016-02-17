class ContraceptivesController < ApplicationController
	before_action :authenticate_doctor!
	before_action :set_gynecology_template
	before_action :authenticate_doctor_for_gynecology_template!, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_contraceptive, only: [:show, :edit, :update, :destroy]

	def new
		@contraceptive = @gynecology_template.contraceptives.build
	end

	def create
		@contraceptive = @gynecology_template.contraceptives.build(contraceptive_params)
		if @contraceptive.save
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
		if @contraceptive.update(contraceptive_params)
			redirect_to @gynecology_template
		else
			flash[:error] = "Hubo un error, vuelve a intentar."
			render action: "edit"
		end
	end

	def destroy
		@contraceptive.destroy
		redirect_to @gynecology_template
	end

	private
		def set_gynecology_template
			@gynecology_template = GynecologyTemplate.find(params[:gynecology_template])
		end
		def set_contraceptive
			@contraceptive = Contraceptive.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				flash[:alert] = "Expediente inexistente."
				redirect_to root_url
		end
end
