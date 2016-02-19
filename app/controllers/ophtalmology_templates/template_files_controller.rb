class OphtalmologyTemplates::TemplateFilesController < TemplateFilesController
  before_action :set_fileable

  private

    def set_fileable
      @fileable = OphtalmologyTemplate.find(params[:ophtalmology_template_id])
      authenticate_doctor_for_template(@fileable)
    end
end