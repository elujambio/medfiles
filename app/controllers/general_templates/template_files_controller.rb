class GeneralTemplates::TemplateFilesController < TemplateFilesController
  before_action :set_fileable

  private

    def set_fileable
      @fileable = GeneralTemplate.find(params[:general_template_id])
      authenticate_doctor_for_template(@fileable)
    end
end