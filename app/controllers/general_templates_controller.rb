class GeneralTemplatesController < ApplicationController
	before_action :authenticate_doctor!
	before_action :check_plan_limit, only: [:new, :create]
	before_action :check_payment_for_templates!
	before_action :set_general_template, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_doctor_for_general_template, only: [:show, :edit, :update, :destroy]
	before_action :find_patient, only: [:edit, :update]


	def index
		@general_templates = GeneralTemplate.where(doctor: current_doctor)
	end

	def new
		@general_template = GeneralTemplate.new
		
	end
	def create
		@general_template = GeneralTemplate.new(general_template_params)
		@general_template.doctor = current_doctor
		if @general_template.save
			Patient.create name: params[:general_template][:patients][:name], birth_date: params[:general_template][:patients][:birth_date], sex: params[:general_template][:patients][:sex], originary_from: params[:general_template][:patients][:originary_from], ocupation: params[:general_template][:patients][:ocupation], religion: params[:general_template][:patients][:religion], address: params[:general_template][:patients][:address], telephone: params[:general_template][:patients][:telephone], email: params[:general_template][:patients][:email], insurance_company: params[:general_template][:patients][:insurance_company], insurance_policy: params[:general_template][:patients][:insurance_policy], templatable_id: @general_template.id, templatable_type: "GeneralTemplate"
			flash[:notice] = "Expediente guardado."
			redirect_to @general_template
		else
			flash[:alert] = "Expediente no guardado. Vuelve a intentar en un rato." 
			render action: "new"
		end
	end

	def show
		#set_current_general_template(@general_template)
	end

	def edit
		
	end

	def update
		if @general_template.update(general_template_params)
			@patient.update_attributes( name: params[:general_template][:patients][:name], birth_date: params[:general_template][:patients][:birth_date], sex: params[:general_template][:patients][:sex], originary_from: params[:general_template][:patients][:originary_from], ocupation: params[:general_template][:patients][:ocupation], religion: params[:general_template][:patients][:religion], address: params[:general_template][:patients][:address], telephone: params[:general_template][:patients][:telephone], email: params[:general_template][:patients][:email], insurance_company: params[:general_template][:patients][:insurance_company], insurance_policy: params[:general_template][:patients][:insurance_policy])
			flash[:notice] = "Expediente guardado."
			redirect_to @general_template
		else
			flash[:alert] = "Expediente no guardado. Vuelve a intentar en un rato." 
			render action: "edit"
		end
	end

	def destroy 
		@general_template.destroy 
		flash[:notice] = "Expediente eliminado."
		redirect_to root_url
	end
	private
		def set_general_template
			@general_template = GeneralTemplate.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Expediente inexistente."
			redirect_to root_url
		end

		def general_template_params
			params.require(:general_template).permit(:marital_status ,:reason,:mother_background,:father_background,:grandparents_background,:siblings_background,:parents_siblings_background,:children_background,:husband_background,:personal_background,:diet,:physical_exercise,:housing_perks,:smoking,:alergies,:drugs,:alcoholism,:inmunizations,:traumatics,:surgicals,:transfusions,:menarche,:gesta,:abortions,:rhythm,:pregnancies,:contraceptives,:last_period_date,:ivsa,:current_ailment,:cardio,:neuro,:gastro,:respiratory,:derma,:muscle,:urinary,:ta,:fc,:fr,:temperature,:weight,:size,:habitus,:head,:neck,:torax,:abdomen,:limbs ,:lab_results,:diagnosis,:treatment,:other_1,:other_2,:other_3,:other_4,:other_5
)
		end

		def find_patient
			@patient = Patient.find_by(templatable_id: @general_template.id, templatable_type: "GeneralTemplate")
		end	

		def check_plan_limit
			check_plan_limit_all_templates(current_doctor.general_templates.count)
		end

		def authenticate_doctor_for_general_template
			authenticate_doctor_for_elements(@general_template)
		end
end
