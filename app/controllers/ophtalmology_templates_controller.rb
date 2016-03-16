class OphtalmologyTemplatesController < ApplicationController
	before_action :authenticate_doctor!
	before_action :set_ophtalmology_template, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_doctor_for_ophtalmology_template, only: [:show, :edit, :update, :destroy]
	before_action :find_patient, only: [:edit, :update]
	def index
		@ophtalmology_templates = OphtalmologyTemplate.where(doctor: current_doctor)
	end
	def new 
		@ophtalmology_template = OphtalmologyTemplate.new
		1.times { @ophtalmology_template.patients.new }
	end
	def create
		@ophtalmology_template = OphtalmologyTemplate.new(ophtalmology_template_params)

		@ophtalmology_template.doctor = current_doctor
		if @ophtalmology_template.save 
			Patient.create name: params[:ophtalmology_template][:patients][:name], birth_date: params[:ophtalmology_template][:patients][:birth_date], sex: params[:ophtalmology_template][:patients][:sex], originary_from: params[:ophtalmology_template][:patients][:originary_from], ocupation: params[:ophtalmology_template][:patients][:ocupation], religion: params[:ophtalmology_template][:patients][:religion], address: params[:ophtalmology_template][:patients][:address], telephone: params[:ophtalmology_template][:patients][:telephone], email: params[:ophtalmology_template][:patients][:email], insurance_company: params[:ophtalmology_template][:patients][:insurance_company], insurance_policy: params[:ophtalmology_template][:patients][:insurance_policy], templatable_id: @ophtalmology_template.id, templatable_type: "OphtalmologyTemplate"

			flash[:notice] = "Expediente guardado."
			redirect_to @ophtalmology_template
		else
			flash[:alert] = "Expediente no guardado. Vuelve a intentar en un rato."
			render action: "new"
		end
	end
	def show 
	end
	def edit 
		
	end 
	def update
		
		if @ophtalmology_template.update(ophtalmology_template_params)
			@patient.update_attributes( name: params[:ophtalmology_template][:patients][:name], birth_date: params[:ophtalmology_template][:patients][:birth_date], sex: params[:ophtalmology_template][:patients][:sex], originary_from: params[:ophtalmology_template][:patients][:originary_from], ocupation: params[:ophtalmology_template][:patients][:ocupation], religion: params[:ophtalmology_template][:patients][:religion], address: params[:ophtalmology_template][:patients][:address], telephone: params[:ophtalmology_template][:patients][:telephone], email: params[:ophtalmology_template][:patients][:email], insurance_company: params[:ophtalmology_template][:patients][:insurance_company], insurance_policy: params[:ophtalmology_template][:patients][:insurance_policy])
			flash[:notice] = "Expediente guardado."
			redirect_to @ophtalmology_template
		else
			flash[:alert] = "Expediente no guardado. Vuelve a intentar en un rato."
			render action: "edit"
		end
	end 
	def destroy
		@ophtalmology_template.destroy 
		flash[:notice] = "Expediente eliminado."
		redirect_to root_url
		#Should redirect to index 
	end 
	private 
		def set_ophtalmology_template
			@ophtalmology_template = OphtalmologyTemplate.find(params[:id])
			rescue ActiveRecord::RecordNotFound 
			flash[:alert] = "Expediente inexistente."
			redirect_to root_url
		end
		def ophtalmology_template_params
			params.require(:ophtalmology_template).permit(:previous_revisions,:current,:ailments,:family_hypertension,:family_cardiopathy,:family_thyroid,:family_cancer,:family_other,:family_myopia,:farsightedness,:astigmatism,:family_diabetic_retinopathy,:family_eye_surgery,:family_cataract,:family_retinal_deatachment,:family_laser_surgery,:family_other_ailments_2,:patient_diabetes_mellitus,:patient_diabetes_mellitus_time,:patient_diabetes_mellitus_treatment,:patient_arterial_hypertension,:patient_arterial_hypertension_time,:patient_arterial_hypertension_treatment,:patient_nefropathy,:patient_nefropathy_description,:patient_alergies,:patient_alergies_description,:patient_cancer,:patient_cancer_description,:patient_transfution,:patient_transfution_description,:patient_smoking,:patient_ailments_other,:patient_myopia,:patient_myopia_description,:patient_hyperopia,:patient_hyperopia_description,:patient_astigmatism,:patient_astigmatism_description,:patient_presbyopia,:patient_presbyopia_description,:patient_uses_glasses,:patient_uses_glasses_since,:patient_squint,:patient_squint_treatment,:patient_glaucoma,:patient_glaucoma_since,:patient_glaucoma_treatment,:lensometer_left_value,:lensometer_left_value_2,:lensometer_left_value_3,:lensometer_right_value_1,:lensometer_right_value_2,:lensometer_right_value_3,:add,:refraction,:subjective_left_value_1,:subjective_left_value_2,:subjective_left_value_3,:subjective_right_value_1,:subjective_right_value_2,:subjective_right_value_3,:autorefraction_left_value_1,:autorefraction_left_value_2,:autorefraction_left_value_3,:autorefraction_right_value_1,:autorefraction_right_value_2,:autorefraction_right_value_3,:cycloplegic_left_value_1,:cycloplegic_left_value_2,:cycloplegic_left_value_3,:cycloplegic_right_value_1,:cycloplegic_right_value_2,:cycloplegic_right_value_3,:keratometry_left,:keratometry_right,:specular_magnification_left,:specular_magnification_right,:pupillary_reflexes_left,:pupilary_reflexes_right,:ocular_movements,:ocular_movement_version_left,:ocular_movement_version_right,:ppm,:eyelids_left,:eyelids_right,:retinal_deatachment_left,:retinal_deatachment_right,:retinal_deatachment_time,:retinal_deatachment_treatment,:retinal_deatachment_description,:eye_surgery_left,:eye_surgery_right,:other_eye_condition,:pregnancy,:pregnancy_description,:gynobstetric_revision_during_pregnancy,:ailments_during_pregnancy,:ailments_during_pregnancy_treatment,:weight_at_birth,:size_at_birth,:born_of_term,:born_of_term_description,:avsc_first_value,:avsc_second_value,:avsc_third_value,:avcc_first_value,:avcc_second_value,:avcc_third_value,:pinhole_first_value,:pinhole_second_value,:pinhole_third_value,:conjunctiva_left,:conjunctiva_right,:cornea_left,:cornea_right,:antechamber_left,:antechamber_right,:ac_bottom_left_value_1,:ac_bottom_left_value_2,:ac_bottom_right_value_1,:ac_bottom_right_value_2,:intraocular_pressure_left,:intraocular_pressure_2,:goinoscopy_left,:goinoscopy_right,:iris_left,:iris_right,:pupil_right,:pupil_left,:crystaline_left,:crystaline_right,:fundus_right,:fundus_left,:retina_right,:retina_left,:vitreous_left,:vitreous_right,:no_left,:no_right,:no_left_description,:no_right_description,:general_annotations,:diagnosis,:diagnosis_treatment, patients_attributes: [ :name, :birth_date,:sex,:ocupation,:religion,:email,:address,:telephone,:insurance_company,:insurance_policy])
		end 	

		def find_patient
			@patient = Patient.find_by(templatable_id: @ophtalmology_template.id, templatable_type: "OphtalmologyTemplate")
		end	

		def authenticate_doctor_for_ophtalmology_template
			authenticate_doctor_for_elements(@ophtalmology_template)
		end
end
