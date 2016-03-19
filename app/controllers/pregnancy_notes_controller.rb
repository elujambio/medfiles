class noteNotesController < ApplicationController
	before_action :authenticate_doctor!
	before_action :set_gynecology_template
	before_action :authenticate_doctor_for_gynecology_template
	before_action :set_pregnancy_note, only: [:show, :edit, :update, :destroy]

	def new
		@note = @gynecology_template.pregnancy_notes.build
	end

	def create
		@note = @gynecology_template.pregnancy_notes.build(pregnancy_notes_params)
		if @note.save
			flash[:notice] = "La información se ha guardado correctamente."
			redirect_to [@gynecology_template, @note]		
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
		if @note.update(pregnancy_notes_params)
			flash[:notice] = "La información se ha guardado correctamente."
			redirect_to [@gynecology_template, @note]	
		else
			flash[:error] = "No pudimos guardar, vuelve a intentar."
			render action: "edit"

		end
	end

	def destroy
		@note.destroy
		redirect_to @gynecology_template
	end

	private
		def pregnancy_notes_params
			params.require(:pregnancy_note).permit(:note)
		end

		def set_gynecology_template
			@gynecology_template = GynecologyTemplate.find(params[:gynecology_template_id])
		end

		def set_pregnancy_note
			@note = @gynecology_template.pregnancy_notes.find(params[:id])
			rescue  ActiveRecord::RecordNotFound
			flash[:alert] = "información no encontrada."
			redirect_to @gynecology_template
		end

		def authenticate_doctor_for_gynecology_template
			authenticate_doctor_for_elements(@gynecology_template)
		end
end
