class User < ActiveRecord::Base
    #User soll das Identifizierungsmerkmal sein
	acts_as_authentic
	#Roles which a user can have
	ROLES = %w[admin moderator author banned]
end
