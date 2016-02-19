class OphtalmologyTemplates::TemplatePhotosController < TemplatePhotosController
  before_action :set_photable

  private

    def set_photable
      @photable = OphtalmologyTemplate.find(params[:ophtalmology_template_id])
      authenticate_doctor_for_template(@photable)
    end
end