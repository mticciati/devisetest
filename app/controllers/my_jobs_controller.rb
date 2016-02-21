class MyJobsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_current_user
	before_action :set_job_application, only: [:destroy]

	def index
		@job_applications = JobApplication.where({user_id: current_user.id})
		@current_user = current_user
	end

	def destroy
		if @job_application.destroy then redirect_to '/my_jobs' else puts 'Something went wrong...' end
	end

	private

	def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

end
