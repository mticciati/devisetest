class Job < ActiveRecord::Base
	belongs_to :user, inverse_of: :job
	validates :user, present: true 
	has_many :job_applications
end
