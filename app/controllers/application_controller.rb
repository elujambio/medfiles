class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_devise_params, if: :devise_controller?
  before_action :set_locale

  
  def set_locale
    I18n.locale = :es
  end
 

    def configure_devise_params
    	devise_parameter_sanitizer.for(:sign_up) do |parameters|
        	parameters.permit(:email, :password, :password_confirmation, :name, :practice_address_1, :practice_address_2, :postal_code, :country, :state, :city, :phone, :cellphone, :facebook, :website, :profession, :speciality, :created_at, :updated_at)
        end
        devise_parameter_sanitizer.for(:account_update) do |parameters|
    		parameters.permit(:email, :password, :password_confirmation, :name, :practice_address_1, :practice_address_2, :postal_code, :country, :state, :city, :phone, :cellphone, :facebook, :website, :profession, :speciality, :created_at, :updated_at, :current_password)
    	end
    end  
    def authenticate_doctor_for_ophtalmology_template!
      if current_doctor != @ophtalmology_template.doctor
        flash[:error] = "No puedes ver el expediente."
        redirect_to root_url
      end
    end
    helper_method :authenticate_doctor_for_ophtalmology_template! 
    
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
end
