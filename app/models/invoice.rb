class Invoice < ActiveRecord::Base
	belongs_to :doctor

	validate :validate_favorite

	private
		def validate_favorite
			isFavorite = false			
			self.doctor.invoices.each do |invoice|
				if invoice.favorite == true 
					isFavorite = true
				end
			end

			if isFavorite == true and self.favorite == true
				errors.add(:base, "Ya tienes unos datos de facturación marcados como favoritos, si quieres marcar estos como favoritos debes de modificar los otros primero.")
			end
		end
end
