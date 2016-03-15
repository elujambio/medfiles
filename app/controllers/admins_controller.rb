class AdminsController < ApplicationController
	before_action :authenticate_admin!
	def admin_panel
	end

	def all_gynecologists
		@gynecologists = Doctor.where(speciality: "Ginecología").paginate(page: params[:page], per_page: 20)
	end

	def all_ophthalmologists
		@ophthalmologists = Doctor.where(speciality: "Oftalmología").paginate(page: params[:page], per_page: 20)
	end

	def show_doctor
		@doctor =  Doctor.find(params[:format])
		@active_plans = Plan.where("doctor_id = ? AND active = ?", @doctor, 1)
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "No encontramos lo que buscabas"
			redirect_to root_url
	end

	def overdue_template_plans
		@overdue_payments = Payment.where('next_payment < ? and accepted_payment = ?', Date.today + 3.months, false)
	end

	def due_template_plans
		@due_payments = Playment.where('next_payment = ? and accepted_payment = ?', Date.today - 7.days, false)
	end

	def admin_templates_panel
	end

	def show_invoice_data
		@invoice =  Doctor.find(params[:format])
	end
end
