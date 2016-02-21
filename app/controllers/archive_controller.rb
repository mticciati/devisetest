class ArchiveController < ApplicationController
	before_action :authenticate_user!
	before_action :set_current_user
	def index
		@jobs = Job.where({archived: 1})
	end

	def unarchive
		@job = Job.find(params[:id])
		@job.archived = 0
		if @job.save
			redirect_to '/archives'
		else
			puts 'Unarchive error...'
		end
	end
end

