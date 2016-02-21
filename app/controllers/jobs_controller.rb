class JobsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_job, only: [:show, :edit, :update]
	before_action :set_current_user


	def index
		@jobs = Job.all
	end

	## user.admin && user.manager
	def new
		@job = Job.new
	end

	def create 
		@job = Job.new(job_params)
		@job.user_id = current_user.id
		if @job.save
			redirect_to '/jobs'
		else
			redirect_do '/jobs/new'
		end
	end

	def edit
	end

	def update
		if @job.update(job_params)
			redirect_to jobs_path
		else
			redirect_to edit_job_path(@job)
		end
	end


	private

	def set_job
		@job = Job.find(params[:id])
	end

	def job_params
		params.require(:job).permit(:job_title, :qualified) #QUALIFIED NOT WORKING
	end

end
