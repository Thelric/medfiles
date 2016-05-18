class PatientsController < ApplicationController

	def index
		# @patients = Patient.all
		@patients = Patient.joins(:us_pat_rels).where("user_id = ?", current_user.id)
	end

	def show
		@patient = Patient.find(params[:id])
	end

	def new
		@patient = Patient.new
	end

	def edit
		@patient = Patient.find(params[:id])
	end

	def create
		@patient = Patient.new(patient_params)

		if @patient.save
			@us_pat_rel = UsPatRel.new user_id: current_user.id, patient_id: @patient.id
			@us_pat_rel.save
			redirect_to @patient
		else
			render 'new'
		end
	end

	def update
		@patient = Patient.find(params[:id])

		if @patient.update(patient_params)
			redirect_to @patient
		else
			render 'edit'
		end
	end

	def destroy
		@patient = Patient.find(params[:id])
		@patient.destroy

		redirect_to patients_path
	end

	def correo
		@patient = Patient.find(params[:id])
		Notifier.sample_email(params[:id]).deliver
		redirect_to @patient
	end

	private
		def patient_params
			params.require(:patient).permit(:appat, :apmat, :name, :sex, :age, :eciv, :calle, :cnum, :tcasa, :tof, :cel, :email)
		end

end
