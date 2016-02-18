class GynecologyTemplatesController < ApplicationController
	before_action :authenticate_doctor!
	before_action :set_gynecology_template, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_doctor_for_gynecology_template!, only: [:show, :edit, :update, :destroy]

	def index
		@gynecology_templates = GynecologyTemplate.where(doctor: current_doctor)
	end

	def new
		@gynecology_template = GynecologyTemplate.new
		1.times { @gynecology_template.contraceptives.build }
		1.times { @gynecology_template.pregnancies.build }
	end
	def create
		@gynecology_template = GynecologyTemplate.new(gynecology_template_params)
		@gynecology_template.doctor = current_doctor
		if @gynecology_template.save
			flash[:notice] = "Expediente guardado."
			redirect_to @gynecology_template
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
		if @gynecology_template.update(gynecology_template_params)
			flash[:notice] = "Expediente guardado."
			redirect_to @gynecology_template
		else
			flash[:alert] = "Expediente no guardado. Vuelve a intentar en un rato." 
			render action: "edit"
		end
	end

	def destroy 
		@gynecology_template.destroy 
		flash[:notice] = "Expediente eliminado."
		redirect_to root_url
	end
	private
		def set_gynecology_template
			@gynecology_template = GynecologyTemplate.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Expediente inexistente."
			redirect_to root_url
		end

		def gynecology_template_params
			params.require(:gynecology_template).permit(:register, :name, :email, :husband_name, :address, :telephone, :age, :husband_age, :marital_status, :ocupation, :husband_ocupation, :reason, :mother_background, :father_background, :grandparents_background, :siblings_background, :parents_siblings_background, :children_background,:husband_background,:personal_background,:diet,:smoking,:alergies,:drugs,:alcoholism,:inmunizations,:traumatics,:surgicals,:transfusions,:menarche,:rhythm,:dysmenorrhea,:circumcised_partner,:ivsa,:number_of_sexual_partners,:pms,:pms_duration,:gestate,:gestate_for,:c_section,:abortions,:ee,:induction,:gestational_age,:fum,:fup,:fua,:fuc,:fpp,:doc,:previous_preganancy_complications,:colposcopy,:sexual_habits,:fridigity,:dyspareunia,:menopause,:menopause_symptomatology,:leucorrea ,:leucorrea_treatment,:pregnancy_medication,:ta,:weight,:size,:habitus, :head, :neck, :torax, :abdomen, :limbs, :breasts_appearance, :symetry, :skin_abnormalities, :nipple, :abnormal_mass, :axillary_region, :ganglion_growth, :abnormal_secretion, :mastalgia, :external_aspect, :clitoris, :vulva, :pubic_hair, :himen, :introito, :perine, :vaginal_walls, :secreation_and_discharge, :cervix, :uterus_position, :uterus_consistency, :uterus_size, :uterus_form, :annexes, :speculoscopy, :internal_and_external_genitalia, :clinic_pelvimetry, :impression_diagnosis, :other_1, :other_2, :other_3, :other_4, :other_5, contraceptives_attributes: [:id, :name,:time,:tolerance, :_destroy], pregnancies_attributes: [:id, :pregnancy_number,:pregnancy_date,:abortion, :delivery, :indcution, :ending, :newborn, :baby_weight, :baby_sex, :puerperium, :_destroy])
		end


end
