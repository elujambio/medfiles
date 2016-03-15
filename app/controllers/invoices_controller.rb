class InvoicesController < ApplicationController
	before_action :authenticate_doctor!
	before_action :set_invoice, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_doctor_for_invoice, only: [:show, :edit, :update, :destroy]
	def index
		@invoices = Invoice.where(doctor: current_doctor)
	end
	def new
		@invoice = Invoice.new
	end

	def create
		@invoice = Invoice.new(invoice_params)
		@invoice.doctor = current_doctor
		if @invoice.save
			flash[:notice] = "Se han guardado los datos correctamente."
			redirect_to @invoice
		else
			flash[:alert] = "No se han guardado los datos correctamente."
			render action: "new"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @invoice.update(invoice_params)
			flash[:notice] = "Se han guardado los datos correctamente."
			redirect_to @invoice
		else
			flash[:alert] = "No se han guardado los datos correctamente."
			render action: "edit"
		end
	end

	def destroy
		@invoice.destroy
		redirect_to invoices_path
	end

	private

		def invoice_params
			params.require(:invoice).permit(:name, :rfc, :address1, :cp, :favorite, :address2, :num_ext, :num_int, :state, :city, :country)
		end

		def set_invoice
			@invoice = Invoice.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				flash[:alert] = "Datos no encontrados."
				redirect_to root_url
		end

		def authenticate_doctor_for_invoice
			authenticate_doctor_for_elements(@invoice)
		end
end
