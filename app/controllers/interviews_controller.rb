class InterviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @companies = current_user.companies
    @positions = Position.where(company_id: @companies.pluck(:id))
    @interviews = Interview.where(position_id: @positions.pluck(:id))
  end

  def add
    @page_title = "Interview"
    @body_class = 'job_page'

    @interview = Interview.new
    @companies = current_user.companies
    @positions = Position.where(company_id: @companies.pluck(:id))
  end

  def edit
    @page_title = 'Interview'
    @body_class = 'job_page'

    @interview = Interview.where(id: params[:id]).first

    unless @interview.position.company.user == current_user
      redirect_to jobs_path
      return false
    end

    @companies = current_user.companies
    @positions = Position.where(company_id: @companies.pluck(:id))
  end

  def save
    if params[:interview][:id].present?
      @interview = Interview.where(id: params[:interview][:id]).first
      @interview.update(permitted_params)

      unless @interview.position.company.user == current_user
        redirect_to jobs_path
        return false
      end
    else
      @interview = Interview.new(permitted_params)
    end
    
    if @interview.save!
      flash[:alert] = 'Save successful :D'
    else
      flash[:alert] = 'Save unsuccessful :/'
    end
    
    redirect_to params[:interview][:referrer]
  end

  def delete
    @interview = Interview.where(id: params[:id]).first

    unless @interview.position.company.user == current_user
      redirect_to jobs_path
      return false
    end

    @interview.delete

    redirect_to interview_path
  end

  private

  def permitted_params
    params.require(:interview).permit(:interview_date,:notes,:thank_you_sent,:position_id)
  end
end
