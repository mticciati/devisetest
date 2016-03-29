class Job < ActiveRecord::Base
	belongs_to :user
	has_many :job_applications

	validates :job_title, presence: true
	
end
