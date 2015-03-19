class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @page_title = "Jobs Central"
    @body_class = "job_page"

    @companies = current_user.companies
    @positions = Position.where(company_id: @companies.pluck(:id))
    @interviews = Interview.where(position_id: @positions.pluck(:id))
  end

  def company
    @page_title = 'Company'
    @body_class = 'job_page'

    @company = Company.new
  end

  def create_company
  	company_params = params.require(:company).permit(:name,:notes,:location,:url,:user_id)
    company_params[:user_id] = current_user.id
  	@company = Company.new(company_params)
  	if @company.save!
  	  flash[:alert] = 'Save successful :D'
  	  redirect_to jobs_url
  	else
  	  flash[:alert] = 'Save unsuccessful :/'
  	  redirect_to 'company'
  	end
  end

  def position
    @page_title = 'Position'
    @body_class = 'job_page'

    @position = Position.new
    @companies = current_user.companies
  end

  def create_position
  	position_params = params.require(:position).permit(:title,:url,:notes,:date_applied,:hear_back,:company_id)
  	@position = Position.new(position_params)
  	if @position.save!
  	  flash[:alert] = 'Save successful :D'
  	  redirect_to jobs_url
  	else
  	  flash[:alert] = 'Save unsuccessful :/'
  	  redirect_to 'position'
  	end
  end

  def interview
    @page_title = "Interview"
    @body_class = 'job_page'

    @interview = Interview.new
    @companies = current_user.companies
    @positions = Position.where(company_id: @companies.pluck(:id))
  end

  def create_interview
  	interview_params = params.require(:interview).permit(:interview_date,:approx_length,:notes,:thank_you_sent,:position_id)
  	@interview = Interview.new(interview_params)
  	if @interview.save!
  	  flash[:alert] = 'Save successful :D'
  	  redirect_to jobs_url
  	else
  	  flash[:alert] = 'Save unsuccessful :/'
  	  redirect_to 'interview'
  	end
  end
end
