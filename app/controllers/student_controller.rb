class StudentController < ApplicationController
  before_action :set_student


def student_view
    @exams = Exam.where(status: 1, approved: true) #only approved 
end

def student_view_exam_questions
  subject = params[:subject]
  @exam = Exam.find_by(subject: subject)
  if @exam
    @questions = @exam.questions
  else
    flash[:alert] = "No exam found for the selected subject."
    redirect_to student_view_exams_path # Redirect to the previous page or another appropriate location
  end
end

def submit_student_exam
  @exam = Exam.find(params[:id])
  total = 0
  student_answers = {} # Create a hash to store student answers for each question

  @exam.questions.each do |question|
    user_answer = params.dig(:exam, :questions, question.id.to_s, :text_ans)

    if user_answer.present?
      if user_answer == question.correct_option
        total += question.score
      end

      student_answers[question.id] = user_answer
    end
  end

  current_user.total_score = total
  current_user.update(total_score: total)

  current_user.exams.where(id: @exam.id).update(exam_taken: true)

  @result = Result.create(user: current_user, exam: @exam, total_score: total, text_ans: student_answers)

  redirect_to student_view_path
end

def student_exams
  @user = current_user
  @results = @user.results.includes(:exam)
end


private

def set_student
    @student = current_user
  end

end
