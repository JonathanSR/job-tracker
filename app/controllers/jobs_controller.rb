class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @categories = Category.all
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @categories = Category.all
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:company_id])
    #@category = Category.find(params[:category_id])
    @job = Job.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @company = Company.find(params[:company_id])
    @categories = Category.all
    @job = Job.find(params[:id])
  end

  def update
   @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
