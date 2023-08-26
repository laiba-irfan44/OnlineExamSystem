class TeacherController < ApplicationController
 before_action :authenticate_user!
  before_action :check_teacher_role


def index
   @exam = Exam.order(created_at: :desc).first
  end
def review_scores
  @results = Result.all.includes(:exam, :user)
end


def review_exam
  # Retrieve the list of students
  @students = User.where(role: 'student')

  # Retrieve the exams taken by each student
  @exam_results = Result.where(user: @students).includes(:exam)

  # Render the view to display this information
end

 def approval_request
    @exam = Exam.find(params[:id])
     @exam.update(status: 'sent')  # status 2 indicates that req is sent
     current_user.update(request_sent: false)
    redirect_to exams_path    
 end


  private

  def check_teacher_role
    unless current_user.teacher?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
