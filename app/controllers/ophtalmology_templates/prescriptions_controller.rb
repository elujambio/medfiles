class OphtalmologyTemplates::PrescriptionsController < PrescriptionsController
  before_action :set_prescriptable
  before_action :authenticate_doctor_for_template!
  private

    def set_prescriptable
      @prescriptable = OphtalmologyTemplate.find(params[:ophtalmology_template_id])
    end
end