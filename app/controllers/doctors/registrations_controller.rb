class Doctors::RegistrationsController < Devise::RegistrationsController
 
	#skip_before_filter :require_no_authentication
  def create
    build_resource(sign_up_params)
    if resource.save
	    if resource.active_for_authentication?
	    		@plan = Plan.create doctor_id: resource.id, valid_til: Date.today + 15.days, valid_from: Date.today, grace_til: Date.today + 15.days, active: -5 
  				@template_plan = TemplatePlan.find_by_name("Plan 500")
  				@plan.plan_elements.create(element: @template_plan)
		   		flash[:notice] = "Bienvenido"
		          sign_up(resource_name, resource)
        		respond_with resource, location: after_sign_up_path_for(resource)
	      	else
		        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
		        expire_session_data_after_sign_in!
		        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
	      	end
	    else
	    	clean_up_passwords resource
	    	respond_with resource
	    end
  
  
  end
	private

		def sign_up_params
			devise_parameter_sanitizer.sanitize(:sign_up)
		end


end 