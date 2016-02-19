class OphtalmologyTemplates::TemplatePhotosController < TemplatePhotosController
  before_action :set_photable
  before_action :authenticate_doctor_for_template!
  private

    def set_photable
      @photable = OphtalmologyTemplate.find(params[:gynecology_template_id])
    end
end