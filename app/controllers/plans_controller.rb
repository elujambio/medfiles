class PlansController < ApplicationController
	before_action :set_plan, only: [:show, :edit, :update, :destroy]

	def new
		@plan = Plan.new
		
	end
	def create
		@plan = Plan.new(plan_params)
		
		if @plan.save
			#@plan.plan_elements.create(element: )
			flash[:notice] = "Plan guardado."
			redirect_to @plan
		else
			flash[:alert] = "Plan no guardado. Vuelve a intentar en un rato." 
			render action: "new"
		end
	end

	def save_template_plan
		@plan = Plan.new
		if admin_signed_in?
			@plan.doctor = Doctor.find(params[:doctor_id])
		else
			@plan.doctor = current_doctor
		end
		
		@plan.valide_til = Date.today + 1.years
		@plan.billing_frequency = params[:billing_frequency]
		@plan.billing_preference = params[:billing_preference]
		@template_plan = TemplatePlan.find(params[:template_id])
		
		if @plan.save
			@plan.plan_elements.create(element: @template_plan)
			flash[:notice] = "Plan guardado."
			redirect_to @plan
		else
			flash[:alert] = "Plan no guardado. Vuelve a intentar en un rato." 
			render action: "new"
		end
	end

	def show
		#set_current_plan(@plan)
	end

	def edit
		
	end

	def update
		if @plan.update(plan_params)
			flash[:notice] = "Plan guardado."
			redirect_to @plan
		else
			flash[:alert] = "Plan no guardado. Vuelve a intentar en un rato." 
			render action: "edit"
		end
	end

	def destroy 
		@plan.destroy 
		flash[:notice] = "Plan cancelado."
		redirect_to plans_path
	end
	private
		def set_plan
			@plan = TemplatePlan.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Plan inexistente."
			redirect_to root_url
		end

		def plan_params
			params.require(:plan).permit(:valide_til, :billing_frequency, :billing_preference)
		end
end
