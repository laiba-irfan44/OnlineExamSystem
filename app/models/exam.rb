class Exam < ApplicationRecord
  enum status: { cancel:0 , approve:1 , sent:2 , submitted:3}

  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'
  belongs_to :user
  has_many :questions, dependent: :destroy
  validate :teacher_can_have_one_pending_exam, on: :create
  attribute :approved, default: false
  attribute :request_sent, :boolean, default: true
  has_many :results, dependent: :destroy
  has_many :users, through: :results
  validates :subject, presence: true

   def teacher_can_have_one_pending_exam
    if self.status == 'pending' && self.teacher.pending_exam.present?
      errors.add(:base, 'You already have a pending exam for approval.')
    end
  end
   scope :to_approve, -> { where(approved: false, status: 2) }
end
