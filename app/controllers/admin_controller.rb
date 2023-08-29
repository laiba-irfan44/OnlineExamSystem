class AdminController < ApplicationController

	def index
    @exams = Exam.all
  end

  def admin_view
   @exams = Exam.where(teacher_id: User.teacher.pluck(:id))
   @exams_to_approve = Exam.where(approved: false, status:2)
  end

 def admin_question
  @exam = Exam.find(params[:id])
  @questions = @exam.questions
 end
 
 def approve
  @exam = Exam.find(params[:id])
  @exams_to_approve = Exam.where(approved: false)
  @exam.update(approved: true, status:1)
  # @exam.update(status: 1)
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
  @results = Result.with_associations.all
 end

end

