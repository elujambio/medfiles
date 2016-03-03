class PatientsController < ApplicationController
	before_action :authenticate_doctor!
	before_action :set_patient, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_doctor_for_patient!, only: [:show, :edit, :update, :destroy]
	def index
	end
	def new
		@patient = Patient.new
	end
	def create 
		@patient = Patient.new(patient_params)
		@patient.doctor = current_doctor
		if @patient.save
			flash[:notice] = "Paciente guardado"
			redirect_to @patient
		else
			flash[:alert] = "Paciente no guardado. Vuelve a intentar en un rato."
			render action: "new"
		end 

	end
	def show 
	end
	def edit 
	end 
	def update
		if @patient.update(patient_params)
			flash[:notice] = "Paciente guardado"
			redirect_to @patient 
		else
				flash[:alert] = "Paciente no guardado. Vuelve a intentar en un rato."
				render action: "edit"
		end
	end 
	def destroy 
		@patient.destroy
		flash[:notice] = "Paciente eliminado"
		redirect_to patient_new
	end 
	private 
		def set_patient 
			@patient = Patient.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Paciente Inexistente"
			redirect_to root_url
		end
		def patient_params 
			params.require(:patient).permit(:name, :birth_date, :sex, :originary_from, :ocupation, :religion, :address, :telephone, :email, :insurance_company, :insurance_policy)
		end

end
