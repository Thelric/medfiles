class AppointmentsController < ApplicationController
	def index
		#@appointment = Appointment.all
		@appointment = Appointment.all.where("patient_id in (?)", Patient.select("id").joins(:us_pat_rels).where("user_id = ?", current_user.id)).order("fecha asc")
	end

	def new
		@date = params[:date] ? Date.parse(params[:date]) : Date.today
		@hora = params[:hora] ? params[:hora] : "10:00"
	end

	def create
		# @patient = Patient.find(params[:patient_id])
		# @physician = Physician.find(params[:physician_id])
		@appointment = Appointment.new(appointments_params)

		if @appointment.save
			redirect_to calendar_path
		else
			#raise 'error' 
			render 'new'
		end
	end

	private
		def modify_params
			params[:appointment][:fecha] = DateTime.strptime(params['appointment']['date'] + " " + params['appointment']['hora'], '%Y-%m-%d %H:%M')
		end

		def appointments_params
			modify_params
			params.require(:appointment).permit(:patient_id, :physician_id, :fecha, :reminded)
		end
end
