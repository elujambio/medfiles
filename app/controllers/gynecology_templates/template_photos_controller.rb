class GynecologyTemplates::TemplatePhotosController < TemplatePhotosController
  before_action :set_photable

  private

    def set_photable
      @photable = GynecologyTemplate.find(params[:gynecology_template_id])
      authenticate_doctor_for_template(@photable)
    end
end