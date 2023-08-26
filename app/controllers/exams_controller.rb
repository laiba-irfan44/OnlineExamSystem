class ExamsController < ApplicationController
  before_action :set_exam, only: %i[show edit update destroy]
  
  def index
    @exams = policy_scope(Exam)
  end

  def new
    @exam = Exam.new
    authorize @exam
  end

  def create
    exam_inputs = exam_params
    exam_inputs[:teacher_id] = current_user.id
    @exam = current_user.exams.build(exam_inputs)
    authorize @exam

    respond_to do |format|
      if @exam.save
        format.html { redirect_to exam_url(@exam), notice: "Exam was successfully created." }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
   
  end

# when adding question --- makes ques object
  def show
    @question = @exam.questions.build
  end

  def edit
  end

  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to exam_url(@exam), notice: "Exam was successfully updated." }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exam.destroy
    redirect_to exams_url, notice: 'Exam was successfully destroyed.'
  end

#----------------------------------------------------------------------------

private

def set_exam
  if current_user.admin?
    @exam = Exam.find(params[:id])
  else
    @exam = current_user.exams.find(params[:id])
  end
    authorize @exam
  end

def exam_params
  params.require(:exam).permit(:subject, :start_time, :end_time, :status, :teacher_id)
end

end
