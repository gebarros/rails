class ExamsController < ApplicationController
	before_action :load_exam, only: [:show, :edit, :update, :destroy]

  def index
    @exams = Exam.all
  end
    
  def show
  end
    
  def new 
    @exam = Exam.new
  end
    
  def edit 
  end
    
  def create
    @exam = Exam.new(exam_params)
    
    if @exam.save
        redirect_to @exam
    else
        render 'new'
    end
  end
    
  def update
    if @exam.update(exam_params)
        redirect_to @exam
    else
        render 'edit'
    end 
  end
    
  def destroy
    @exam.destroy
  
    redirect_to exams_path
  end
    
	private
	def load_exam
		@exam = Exam.find(params[:id])
	end

  def exam_params
    params
      .require(:exam)
      .permit(
        :delivery_date, 
        :exam_date, 
        :exam_type 
      )
  end

end
