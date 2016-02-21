class JobApplicationController < ApplicationController
	before_action :authenticate_user!
	before_action :set_current_user

	def index
	end
	
	def show
		@job = Job.find(params[:id])
		@job_application = JobApplication.new
		@job_application.job_id = @job.id
	end
	
	def create
		@job_application = JobApplication.new(job_application_params)
		@job_application.user_id = current_user.id
		if @job_application.save
			Job.increment_counter(:applicants, @job_application.job_id)
			redirect_to '/my_jobs'
		else
			redirect_to '/job_appications/#{@job.id}'
		end
	end

	private

	def job_application_params
		params.require(:job_application).permit(:job_id, :qualified)
	end

end
