class AdminController < ApplicationController

	def index
  # Retrieve a list of exams, possibly filtered or sorted
  @exams = Exam.all # You can adjust this to retrieve the exams you need.
end

def admin_view
  @exams = Exam.where(teacher_id: User.teacher.pluck(:id))
  @exams_to_approve = Exam.where(approved: false, status:2)
end
def admin_question_view
   
  @exam = Exam.find(params[:id])
  @questions = @exam.questions
  @exams_to_approve = Exam.where(approved: false, status:2)
end

def approve
  @exam = Exam.find(params[:id])
  @exams_to_approve = Exam.where(approved: false)
  @exam.update(approved: true)
  @exam.update(status: 1)
  teacher = User.find(@exam.teacher_id) # Find the teacher who created the request
  teacher.update(request_sent: true)
  if params[:user] && params[:user][:request_sent]
  end
  redirect_to admin_index_path_path
end

 # admin can cancel exam 
def cancel
  @exam = Exam.find(params[:id])
    if @exam.destroy
      teacher = User.find(@exam.teacher_id)
       teacher.update(request_sent: true)
      flash[:notice] = 'Exam has been canceled and deleted.'
    else
      flash[:alert] = 'Exam could not be deleted.'
    end
  redirect_to admin_index_path_path
end

def review_scores
  @results = Result.all.includes(:exam, :user)
end

end

