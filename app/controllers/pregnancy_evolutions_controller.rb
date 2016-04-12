class PregnancyEvolutionsController < ApplicationController
	before_action :authenticate_doctor!
	before_action :set_gynecology_template
	before_action :authenticate_doctor_for_gynecology_template
	before_action :set_pregnancy_evolution, only: [:show, :edit, :update, :destroy]
	def new
		@pregnancy = @gynecology_template.pregnancy_evolutions.build
	end

	def create
		@pregnancy = @gynecology_template.pregnancy_evolutions.build(pregnancy_evolutions_params)
		if @pregnancy.save
			flash[:notice] = "La información se ha guardado correctamente."
			redirect_to [@gynecology_template, @pregnancy]		
		else
			flash[:error] = "No pudimos guardar, vuelve a intentar."
			render action: "new"

		end
	end

	def show
	end

	def edit
	end

	def update
		if @pregnancy.update(pregnancy_evolutions_params)
			flash[:notice] = "La información se ha guardado correctamente."
			redirect_to [@gynecology_template, @pregnancy]	
		else
			flash[:error] = "No pudimos guardar, vuelve a intentar."
			render action: "edit"

		end
	end

	def destroy
		@pregnancy.destroy
		redirect_to @gynecology_template
	end

	private
		def pregnancy_evolutions_params
			params.require(:pregnancy_evolution).permit(:day, :weeks_with_amenorrhea, :blood_pressure, :edema, :uterus_bottom, :fetal_heartbeat, :fetal_movements, :presentation, :pain, :genital_bleeding, :headache, :visual_hearing, :vomit, :urinales, :intestinal, :hb_htc, :glycemia, :albuminuria, :genital_exp, :treatment)
		end

		def set_gynecology_template
			@gynecology_template = GynecologyTemplate.find(params[:gynecology_template_id])
		end

		def set_pregnancy_evolution
			@pregnancy = @gynecology_template.pregnancy_evolutions.find(params[:id])
			rescue  ActiveRecord::RecordNotFound
			flash[:alert] = "información no encontrada."
			redirect_to @gynecology_template
		end
		def authenticate_doctor_for_gynecology_template
			authenticate_doctor_for_elements(@gynecology_template)
		end
end
