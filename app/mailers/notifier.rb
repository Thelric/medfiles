class Notifier < ApplicationMailer
	default from: "chalado1@gmail.com"

	def sample_email(patient)
		@patient = Patient.find(patient)
		mail(to: @patient.email, subject: 'Recordatorio de cita')
	end
end
