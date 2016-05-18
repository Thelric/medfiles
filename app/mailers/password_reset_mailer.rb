class PasswordResetMailer < ApplicationMailer
	default from: "chalado1@gmail.com"

	def reset_email(user)
		@user = user
		mail(to: @user.email, subject: 'Password reset instructions')
	end
end