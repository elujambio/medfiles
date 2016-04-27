class GeneralTemplates::TemplatePhotosController < TemplatePhotosController
  before_action :set_photable

  private

    def set_photable
      @photable = GeneralTemplate.find(params[:general_template_id])
      authenticate_doctor_for_template(@photable)
    end
end