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
    else
      # Handle validation errors if needed
    end
  end

  def show
    @result = Result.find(params[:id])
    # Ensure that the user accessing the result is authorized to do so
    authorize_result_access(@result)

    # Render the result details view
  end

  # Add other actions as needed (e.g., update, destroy)
    def result_params
    params.require(:result).permit(:total_score, :text_ans)
  end
end
