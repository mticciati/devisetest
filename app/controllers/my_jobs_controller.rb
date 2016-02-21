class MyJobsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_current_user
	before_action :set_job_application, only: [:destroy]

	def index
		if current_user.role == 'applicant'
			@job_applications = JobApplication.where({user_id: current_user.id})
		else
			@jobs = Job.where({user_id: current_user.id})
		end
		@current_user = current_user
	end

	def destroy
		if @job_application.destroy  
			Job.decrement_counter(:applicants, @job_application.job_id)
			redirect_to '/my_jobs' 
		else 
			puts 'Something went wrong...' 
		end
	end

	private

	def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

end
