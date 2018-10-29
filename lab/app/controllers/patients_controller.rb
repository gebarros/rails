class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new 
    @patient = Patient.new
  end

  def edit 
    @patient = Patient.find(params[:id])
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to @patient
    else
      render 'new'
    end
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      redirect_to @patient
    else
      render 'edit'
    end 
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
 
    redirect_to patients_path
  end

  private
  def patient_params
    params
      .require(:patient)
      .permit(
        :address, 
        :address_complement, 
        :address_number, 
        :address_uf, 
        :birth_date, 
        :city, 
        :email, 
        :gender, 
        :name, 
        :phone
      )
  end

end


