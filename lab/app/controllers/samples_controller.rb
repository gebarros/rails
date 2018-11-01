class SamplesController < ApplicationController
	before_action :load_sample, only: [:show, :edit, :update, :destroy]

  def index
    @samples = Sample.all
  end
  
  def show
  end
  
  def new 
    @sample = Sample.new
  end
  
  def edit 
  end
  
  def create
    @sample = Sample.new(sample_params)
  
    if @sample.save
      redirect_to @sample
    else
      render 'new'
    end
  end
  
  def update
    if @sample.update(sample_params)
      redirect_to @sample
    else
      render 'edit'
    end 
  end
  
  def destroy
    @sample.destroy
   
    redirect_to samples_path
  end
  
	private
	def load_sample
		@sample = Sample.find(params[:id])
	end

  def sample_params
    params
      .require(:sample)
      .permit(
        :collect_date, 
        :sample_type
      )
  end
end
