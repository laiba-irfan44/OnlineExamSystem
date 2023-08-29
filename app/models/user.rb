class User < ApplicationRecord
  
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { admin: 'admin', teacher: 'teacher', student: 'student' }
  has_many :exams
  has_many :results,dependent: :destroy

  has_one_attached :image, dependent: :destroy

  def role_from_invitation(invitation_role)
    invitation_role
  end

  def has_taken_exam?(exam)
    results.exists?(exam_id: exam.id)
  end
end
