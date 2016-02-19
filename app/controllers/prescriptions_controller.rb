class PrescriptionsController < ApplicationController
	before_action :authenticate_doctor!
	#before_action :set_template
	#before_action :authenticate_doctor_for_template!, only: [:show, :new, :create, :edit, :update, :destroy]
	before_action :set_prescription, only: [:show, :edit, :update, :destroy]

	def new	
		@prescription = Prescription.new
		@prescription.gynecology_template = params[:gynecology_template]
	end
	def create

		@prescription = Prescription.new(prescription_params)
		case current_doctor.speciality
		when "Ginecología"
			flash[:notice] = "SET."
			@prescription.gynecology_template = params[:gynecology_template]
		when "Oftalmología"
		end
		
		if @prescription.save
			flash[:notice] = "Receta guardada."
			redirect_to @prescription
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
			case current_doctor.speciality
				when "Ginecología"
					redirect_to [@gynecology_template, @prescription]
				when "Oftalmología"
					redirect_to [@phtalmology_template, @prescription]
				end
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
		def set_template
			case current_doctor.speciality
				when "Ginecología"
					if params[:ophtalmology_template_id]
						@gynecology_template = GynecologyTemplate.find(params[:gynecology_template_id])
					end
				when "Oftalmología" 
					if params[:ophtalmology_template_id]
						@ophtalmology_template = OphtalmologyTemplate.find(params[:ophtalmology_template_id])
					end
				end
		end
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
