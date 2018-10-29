class User < ApplicationRecord
  include Clearance::User

	# Clearance::User::Validations.module_eval do

	#   included do
	#     validates :first_name, presence: true
 #  		validates :last_name, presence: true
 # 		validates :username_name, presence: true
 
	#   end
	# end
end


