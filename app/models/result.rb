class Result < ApplicationRecord
  belongs_to :user
  belongs_to :exam

  scope :with_associations, -> { includes(:exam, :user) }
end
