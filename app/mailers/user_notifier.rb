class UserNotifier < ApplicationMailer
	default :from => 'no-reply@meow.com'

	def send_cancelled_job_alert(user, job)
		@user = user
		@job = job
		mail(
			to: user.email,
			subject: 'A job you applied for was cancelled on Job Town!')
	end

	def send_cancelled_application_alert(user, job)
		@user = user
		@job = job
		mail(
			to: user.email,
			subject: 'A job you applied for was cancelled on Job Town!')
	end

end
