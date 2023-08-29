# frozen_string_literal: true

# Question Controller
class QuestionsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_exam
  before_action :set_question, only: %i[show edit update destroy]


  def index
    @questions = @exam.questions
  end


  def edit
    @question = Question.find(params[:id])
  end

 def create
  @question = @exam.questions.build(question_params)
   if @question.question_type == 'text'
      @question.content = params[:question][:content_text]
      @question.score = params[:question][:score_text]
      @question.correct_option = params[:question][:correct_option_text]
   end

  if @question.question_type == 'mcq'
     @question.content = params[:question][:content_mcqs]
     @question.correct_option = params[:question][:correct_option_mcqs]
     @question.score = params[:question][:score_mcqs]
     @question.choices = [
      params[:question][:choices_0],
      params[:question][:choices_1],
      params[:question][:choices_2],
      params[:question][:choices_3]
    ]
  end

  if @question.save
    redirect_to(@question.exam)
  else
    render action: 'new'
  end
 end


 def update
  if @question.update_attributes(question_params)
    redirect_to(@question.exam)
  else
    render action: 'edit'
  end

  def create
    @question = @exam.questions.build(question_params)

    if @question.question_type == 'text'

      @question.content = params[:question][:content_text]
      @question.score = params[:question][:score_text]
      @question.correct_option = params[:question][:correct_option_text]
    end

    if @question.question_type == 'mcq'
      @question.content = params[:question][:content_mcqs]
      @question.correct_option = params[:question][:correct_option_mcqs]
      @question.score = params[:question][:score_mcqs]
      # Assign values from individual fields to the 'choices' array
      @question.choices = [
        params[:question][:choices_0],
        params[:question][:choices_1],
        params[:question][:choices_2],
        params[:question][:choices_3]
      ]

    end

    if @question.save
      redirect_to(@question.exam)
    else
      render action: 'new'
    end
  end

  def update
    if @question.update_attributes(question_params)
      redirect_to(@question.exam)
    else
      render action: 'edit'
    end
  end
 end

 def destroy
  @question.destroy
  redirect_to @exam
 end

  private

  def set_exam
    @exam = current_user.exams.find(params[:exam_id])
  end

  def set_question
    @question = @exam.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :score, :choices, :correct_option, :question_type, :text_ans, :exam_id)
  end
end
