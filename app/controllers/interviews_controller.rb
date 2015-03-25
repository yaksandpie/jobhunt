class InterviewsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def add
    @page_title = "Interview"
    @body_class = 'job_page'

    @interview = Interview.new
    @companies = current_user.companies
    @positions = Position.where(company_id: @companies.pluck(:id))
  end

  def create
    @interview = Interview.new(permitted_params)

    if @interview.save!
      flash[:alert] = 'Save successful :D'
      redirect_to jobs_url
    else
      flash[:alert] = 'Save unsuccessful :/'
      redirect_to 'interview'
    end
  end

  private

  def permitted_params
    params.require(:interview).permit(:interview_date,:notes,:thank_you_sent,:position_id)
  end
end
