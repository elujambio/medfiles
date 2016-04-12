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
		if params[:active] 
			@plan.active = 1

		else
			@plan.active = -4
			@plan.grace_til = Date.today + 15.days
		end
		
		@plan.valid_from = Date.today
		
		
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

			case params[:billing_frequency] 
				when "Mensual"
					Payment.create(next_payment: Date.today, plan: @plan, accepted_payment: false, payment_number: 1)
				when "Semestral"
					Payment.create(next_payment: Date.today, plan: @plan, accepted_payment: false, payment_number: 1)
				when "Anual"
					Payment.create(next_payment: Date.today, plan: @plan, accepted_payment: false, payment_number: 1)
					
			end

			flash[:notice] = "Plan guardado."
			if admin_signed_in?
				redirect_to @plan
			else
				redirect_to doctor_plan_path
			end
		else
			flash[:alert] = "Plan no guardado. Vuelve a intentar en un rato." 
			render action: "new"
		end
	end

	def show
	end

	def doctor_plan
		@plan = Plan.find(params[:format])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Plan inexistente."
			redirect_to root_url
	end
	def template_plan_history
		@doctor =  Doctor.find(params[:format])
		@inactive_plans = Plan.where("doctor_id = ? AND active = ?", @doctor, -3)
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
