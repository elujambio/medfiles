class TemplatePlansController < ApplicationController
	before_action :authenticate_superadmin!
	before_action :set_template_plan, only: [:show, :edit, :update, :destroy]

	def index
		@template_plans = TemplatePlan.paginate(page: params[:page], per_page: 20)
	end

	def new
		@template_plan = TemplatePlan.new
		
	end
	def create
		@template_plan = TemplatePlan.new(template_plan_params)
		
		if @template_plan.save
			flash[:notice] = "Plan de expedientes guardado."
			redirect_to @template_plan
		else
			flash[:alert] = "Plan de expedientes no guardado. Vuelve a intentar en un rato." 
			render action: "new"
		end
	end

	def show
		#set_current_template_plan(@template_plan)
	end

	def edit
		
	end

	def update
		if @template_plan.update(template_plan_params)
			flash[:notice] = "Plan de expedientes guardado."
			redirect_to @template_plan
		else
			flash[:alert] = "Plan de expedientes no guardado. Vuelve a intentar en un rato." 
			render action: "edit"
		end
	end

	def destroy 
		@template_plan.destroy 
		flash[:notice] = "Plan eliminado."
		redirect_to template_plans_path
	end
	private
		def set_template_plan
			@template_plan = TemplatePlan.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Plan inexistente."
			redirect_to root_url
		end

		def template_plan_params
			params.require(:template_plan).permit(:name, :monthly_cost, :anual_discount, :description, :max_files)
		end
end
