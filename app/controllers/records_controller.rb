class RecordsController < ApplicationController
	def create
		@patient = Patient.find(params[:patient_id])
		@record = @patient.records.create(record_params)

		if @record.save
			redirect_to patient_path(@patient)
		else
			#raise 'error' 
			render "patients/show"
		end
	end

	private
		def record_params
			params.require(:record).permit(:fecha, :body)
		end
end
