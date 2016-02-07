class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_devise_params, if: :devise_controller?
    
    def configure_devise_params
    	devise_parameter_sanitizer.for(:sign_up) do |parameters|
        	parameters.permit(:email, :password, :password_confirmation, :name, :practice_address_1, :practice_address_2, :postal_code, :country, :state, :city, :phone, :cellphone, :facebook, :website, :profession, :speciality, :created_at, :updated_at)
        end
        devise_parameter_sanitizer.for(:account_update) do |parameters|
    		parameters.permit(:email, :password, :password_confirmation, :name, :practice_address_1, :practice_address_2, :postal_code, :country, :state, :city, :phone, :cellphone, :facebook, :website, :profession, :speciality, :created_at, :updated_at, :current_password)
    	end
    end  
end
