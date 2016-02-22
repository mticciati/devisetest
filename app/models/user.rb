class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :timeoutable

   	has_many :jobs
end
