class PlansController < ApplicationController
	before_action :set_plan, only: [:show, :edit, :update, :destroy]


	def save_template_plan
		@plan = Plan.new
		if admin_signed_in?
			@plan.doctor = Doctor.find(params[:doctor_id])
		else
			@plan.doctor = current_doctor
		end
		@plan.billing_frequency = params[:billing_frequency]
		@plan.billing_preference = params[:billing_preference]
		@plan.active = 1
		
		case params[:billing_frequency] 
			when "Mensual"
				@plan.valid_til = Date.today + 1.months
			when "Semestral"
				@plan.valid_til = Date.today + 6.months
			when "Anual"
				@plan.valid_til = Date.today + 1.years
		end
		@template_plan = TemplatePlan.find(params[:template_id])
		

		if @plan.save
			@plans = Plan.where(doctor: @plan.doctor)
			@plans.each do |plan|
				plan.plan_elements.each do |element| 
					if element.element_type == "TemplatePlan"
						plan.update_attributes(active: -3)
					end
				end
			end
			@plan.plan_elements.create(element: @template_plan)
			flash[:notice] = "Plan guardado."
			redirect_to @plan
		else
			flash[:alert] = "Plan no guardado. Vuelve a intentar en un rato." 
			render action: "new"
		end
	end

	def show
	end

	
	private
		def set_plan
			@plan = Plan.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Plan inexistente."
			redirect_to root_url
		end

		def plan_params
			params.require(:plan).permit(:valid_til, :billing_frequency, :billing_preference)
		end
end
