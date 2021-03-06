class OphtalmologyTemplates::PrescriptionsController < PrescriptionsController
  before_action :set_prescriptable
 
  private

    def set_prescriptable
      @prescriptable = OphtalmologyTemplate.find(params[:ophtalmology_template_id])
      authenticate_doctor_for_template(@prescriptable)
    end
end