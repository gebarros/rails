class Patients::ExamsController < ApplicationController

  def show
    @patient = Patient.find(params[:patient_id])
    @exam = patient.exams.find(params[:id])
  end

  def new
    patient = Patient.find(params[:patient_id])
    @exam = patient.exams.build
  end

  def edit
    @exam = patient.exams.find(params[:id])
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @exam = patient.exams.build(exam_params)

    if @exam.save
        redirect_to patient_exams_path
    else
        render 'new'
    end
  end

  def update
    @exam = patient.exams.find(params[:id])
    if @exam.update(exam_params)
        redirect_to @exam
    else
        render 'edit'
    end
  end

  def destroy
    @exam = patient.exams.find(params[:id])
    @exam.destroy

    redirect_to exams_path
  end

	private

  def exam_params
    params
      .require(:exam)
      .permit(
        :delivery_date,
        :exam_date,
        :exam_type,
        :patient_id
      )
  end

end
