# app/controllers/answers_controller.rb
class AnswerController < ApplicationController
  before_action :find_question

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    #@answer.question = @question
    @exam = Exam.find(params[:exam_id])

    # Iterate through the submitted responses and create Answer records
    params[:responses].each do |response|
      question_id = response[:question_id]
      content = response[:content]

      # Create an Answer record for the current question
      answer = Answer.new(
        question_id: question_id,
        content: content
      )

    if @answer.save
      redirect_to @question.exam, notice: 'Answer submitted successfully.'
    else
      render :new
    end
  end

  def show
    @answer = Answer.find(params[:id])
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:content, :is_correct)
  end
end
