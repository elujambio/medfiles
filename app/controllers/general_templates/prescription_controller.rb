class GeneralTemplates::PrescriptionsController < PrescriptionsController
  before_action :set_prescriptable
  
  private

    def set_prescriptable
      @prescriptable = GeneralTemplate.find(params[:general_template_id])
      authenticate_doctor_for_template(@prescriptable)
    end
end