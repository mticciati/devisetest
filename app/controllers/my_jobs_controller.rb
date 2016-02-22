class MyJobsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_current_user
	before_action :set_job_application, only: [:destroy]
	before_action :pre_destroy_method, only: [:destroy]

	def index
		if current_user.role == 'applicant'
			@job_applications = JobApplication.where({user_id: current_user.id})
		else
			@jobs = Job.where({user_id: current_user.id, archived: 0})
		end
		@current_user = current_user
	end

	def destroy
		
		if @job_application.destroy  			
			redirect_to '/my_jobs' 
		else 
			puts 'Destroy job_application error...' 
		end
	end

	def archive
		@job = Job.find(params[:id])
		@job.archived = 1
		@job.applicants = 0
		if @job.save
			job_applications = JobApplication.where(job_id: @job.id)
			job_applications.destroy_all	
			redirect_to '/archives'
		else
			puts 'Archive job error...'
		end
	end

	private

	def set_job_application
		@job_application = JobApplication.find(job_id: params[:id])     
  	end

  	def set_job
  		@job = Job.where(id: params[:id])
  	end

	def pre_destroy_method
		Job.decrement_counter(:applicants, params[:id])	
		#@job = Job.where(id: params[:id])
		#@user = User.where(id: @job.user_id)
		#SEND ALERT TO CREATOR OF JOB THAT APPLICANT CANCELLED
	end

end
