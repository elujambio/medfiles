class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_devise_params, if: :devise_controller?

  autocomplete :patient, :name
  before_action :set_locale

  
  def set_locale
    I18n.locale = :es
  end
 
    def configure_devise_params
      devise_parameter_sanitizer.for(:sign_up) do |parameters|
          parameters.permit(:email, :password, :password_confirmation, :name, :practice_address_1, :practice_address_2, :postal_code, :country, :state, :city, :phone, :cellphone, :facebook, :website, :profession, :speciality, :created_at, :updated_at)
        end
      devise_parameter_sanitizer.for(:account_update) do |parameters|
    		parameters.permit(:email, :password, :password_confirmation, :name, :practice_address_1, :practice_address_2, :postal_code, :country, :state, :city, :phone, :cellphone, :facebook, :website, :profession, :speciality, :created_at, :updated_at, :current_password, :professional_license)
    	end

    end  
    def authenticate_doctor_for_ophtalmology_template!
      if current_doctor != @ophtalmology_template.doctor
        flash[:error] = "No puedes ver el expediente."
        redirect_to root_url
      end
    end
    def authenticate_doctor_for_patient! 
      if current_doctor != @patient.doctor
        flash[:error] = "No puedes ver el paciente."
      end
    end

    helper_method :authenticate_doctor_for_ophtalmology_template!
    helper_method :authenticate_doctor_for_patient!
    

     def authenticate_doctor_for_gynecology_template!
      if current_doctor != @gynecology_template.doctor 
        flash[:error] = "No puedes ver el expediente."
        redirect_to root_url
      end
    end
    helper_method :authenticate_doctor_for_gynecology_template!

    def authenticate_doctor_for_template(template)
     if current_doctor != template.doctor 
        flash[:error] = "No puedes ver el expediente."
        redirect_to root_url
      end
      
    end
    helper_method :authenticate_doctor_for_template


     def authenticate_superadmin!
     if admin_signed_in? and !current_admin.superadmin?
        flash[:error] = "No puedes ver el expediente."
        redirect_to root_url
      end
      
    end
    helper_method :authenticate_superadmin!

    def check_plan_limit_all_templates(files_count)
      active = false
      current_doctor.plans.each do |plan| 
        if plan.active == -4 or plan.active == 1
          active = true
          plan.plan_elements.each do |element| 
            if element.element_type == "TemplatePlan" 
              @max_files = element.element.max_files 
            end
          end
        end
      end
      if active == true and files_count >= @max_files
        flash[:alert] = "Haz excedido el límite de expedientes de tu plan."
        redirect_to root_url
      end
    end

    helper_method :check_plan_limit_all_templates

    def check_payment_for_templates!
      current_doctor.plans.each do |plan| 
        if plan.active == -1
          plan.plan_elements.each do |element| 
            if element.element_type == "TemplatePlan" 
              flash[:alert] = "No hemos recibido tu pago."
              redirect_to root_url
            end
          end
        end
      end
    end

    helper_method :check_payment_for_templates!


end

