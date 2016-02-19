class PrescriptionsController < ApplicationController
	before_action :authenticate_doctor!

	before_action :set_prescription, only: [:show, :edit, :update, :destroy]

	def new	
	end
	def create

		@prescription = @prescriptable.prescriptions.new prescription_params
		
		if @prescription.save
			flash[:notice] = "Receta guardada."
			redirect_to @prescriptable
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
		if @prescription.update(prescription_params)
			flash[:notice] = "Receta no guardada."
			redirect_to @prescriptable
		else
			flash[:alert] = "Receta no guardada. Vuelve a intentar en un rato." 
			render action: "edit"
		end
	end

	def destroy 
		@prescription.destroy 
		flash[:notice] = "Receta eliminada."
		redirect_to root_url
	end
	private
		
		def set_prescription
			@prescription = Prescription.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Receta inexistente."
			redirect_to root_url
		end

		def prescription_params
			params.require(:prescription).permit(:prescription, :gynecology_template)
		end


end
