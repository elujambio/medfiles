class PaymentsController < ApplicationController
	before_action :authorize_admin!, only: [:confirm_payment]
	def accept
		
		@payment = Payment.find(params[:format])
		@payment.update_attributes(accepted_payment: true)

		case @payment.plan.billing_frequency
			when "Mensual"
				@c= @payment.payment_number 
				Payment.create(next_payment: @payment.plan.valid_from + @c.months, plan: @payment.plan, accepted_payment: false, payment_number: @payment.payment_number + 1)
			when "Semestral"
				@c= @payment.payment_number * 6
				Payment.create(next_payment: @payment.plan.valid_from + @c.months, plan: @payment.plan, accepted_payment: false, payment_number: @payment.payment_number + 1)
			when "Anual" 
				@c= @payment.payment_number
				Payment.create(next_payment: @payment.plan.valid_from + @c.years, plan: @payment.plan, accepted_payment: false, payment_number: @payment.payment_number + 1)
		end
		redirect_to :back
	end

	def cancel
		@payment = Payment.find(params[:format])
		@payment.update_attributes(accepted_payment: false)
		redirect_to :back
	end
end
