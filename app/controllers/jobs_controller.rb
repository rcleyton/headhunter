class JobsController < ApplicationController
  
  def index
    @jobs = Job.all.order(created_at: :desc)
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else  
      flash.now[:error] = @job.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to @job
      flash[:notice] = 'Vaga atualizada com sucesso'
    else
      render :edit
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :detailed_description, :desired_skills,
                                :salary_range, :vacancy_level, :limit_date,
                                :job_location, :code)
  end
end