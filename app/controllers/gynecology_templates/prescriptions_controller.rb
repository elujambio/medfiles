class GynecologyTemplates::PrescriptionsController < PrescriptionsController
  before_action :set_prescriptable
  
  private

    def set_prescriptable
      @prescriptable = GynecologyTemplate.find(params[:gynecology_template_id])
      authenticate_doctor_for_template(@prescriptable)
    end
end