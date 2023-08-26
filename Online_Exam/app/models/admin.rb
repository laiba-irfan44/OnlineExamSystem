class Admin < ApplicationRecord
	devise :database_authenticatable, :validatable
    include DeviseInvitable::Inviter
end
