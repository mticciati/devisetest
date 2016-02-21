class Job < ActiveRecord::Base
	belongs_to :user, inverse_of: :job
	validates :user_id, present: true 
	has_many :job_applications
end
