# controllers/results_controller.rb
class ResultsController < ApplicationController
  before_action :authenticate_user! # Adjust this based on your authentication system


  def index
     @results = Result.all
     render 'index'
  end

  def create
    @exam = Exam.find(params[:exam_id])
    @result = Result.new(user: current_user, exam: @exam, total_score: params[:total_score])

    if @result.save
      redirect_to exam_path(@exam), notice: 'Result recorded successfully.'
    end
  end

  def show
    @result = Result.find(params[:id])
    authorize_result_access(@result)
  end

  def result_params
    params.require(:result).permit(:total_score, :text_ans)
  end
end
