# frozen_string_literal: true

# Teacher controller
class TeacherController < ApplicationController
<<<<<<< Updated upstream
 before_action :authenticate_user!
 before_action :check_teacher_role
=======
  before_action :authenticate_user!
  before_action :check_teacher_role
>>>>>>> Stashed changes


  def index
    @exam = Exam.order(created_at: :desc).first
  end
<<<<<<< Updated upstream
  
def review_scores
  @results = Result.with_associations.all
end
=======
>>>>>>> Stashed changes

  def review_scores
    @results = Result.with_associations.all
  end

  def review_exam
    # Retrieve the list of students
    @students = User.where(role: 'student')
    @exam_results = Result.where(user: @students).includes(:exam)
  end

  def approval_request
    @exam = Exam.find(params[:id])
    @exam.update(status: 'sent') # status 2 indicates that req is sent
    current_user.update(request_sent: false)
    redirect_to exams_path
  end


  private

  def check_teacher_role
    return if current_user.teacher?

    redirect_to root_path, alert: 'You are not authorized to access this page.'
  end
end
