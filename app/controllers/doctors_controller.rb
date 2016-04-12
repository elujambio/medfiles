class DoctorsController < ApplicationController


	before_action :authenticate_doctor!
	before_action :set_doctor, only: [:show, :edit, :update, :destroy]
	autocomplete :patient, :name

	def panel
		@hasTemplatePlan = false
		current_doctor.plans.each do |plan| 
			if plan.active == -4 or plan.active == 1 or plan.active == -5
				plan.plan_elements.each do |element| 
					if element.element_type == "TemplatePlan" 
					 	@max_files = element.element.max_files 
					 	@hasTemplatePlan = true
					end
				end
			end
		end
		
		case current_doctor.speciality
			when "Ginecología"
				@files = current_doctor.gynecology_templates.count
			when "Oftalmología" 
				@files = current_doctor.ophtalmology_templates.count
		end
				 		 

	end


	def show
	end

	def edit
	end

	def update
		if @doctor.update(doctor_params)
			
			flash[:notice] = "Se han modficado los datos."
			redirect_to @doctor
		else
			flash[:alert] = "No se han modificado los datos."
			render :action => "edit"
		end
	end

	def destroy 
	end

	def search_patient
		@patient = Patient.find(params[:patient_id])
		redirect_to gynecology_template_path(@patient.templatable)
	end

	private
		def set_doctor
			@doctor =  Doctor.find(params[:id])

			rescue ActiveRecord::RecordNotFound
				flash[:alert] = "No encontramos lo que buscabas"
				redirect_to root_url
		end

		def doctor_params
			params.require(:doctor).permit(:email, :name, :practice_address_1, :practice_address_2, :postal_code, :country, :state, :city, :phone, :cellphone, :website, :facebook, :profession, :speciality, :professional_license, :site_active, :templates_active, :templates_active_medium, :templates_active_big, :templates_active_personalized, :max_files, :site_active_from, :templates_active_from, :templates_active_medium_from, :templates_active_big_from, :templates_active_personalized_from)
		end
end
