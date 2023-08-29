# frozen_string_literal: true

class Admin < ApplicationRecord
  devise :database_authenticatable, :validatable
  include DeviseInvitable::Inviter
end
