class GynecologyTemplates::TemplateFilesController < TemplateFilesController
  before_action :set_fileable

  private

    def set_fileable
      @fileable = GynecologyTemplate.find(params[:gynecology_template_id])
      authenticate_doctor_for_template(@fileable)
    end
end