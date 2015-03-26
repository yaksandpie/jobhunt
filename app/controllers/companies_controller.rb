class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def index
    @page_title = 'Company List'
    @body_class = "job_page"

    # get all the companies
    @companies = current_user.companies
  end

  def add
    @page_title = 'Company'
    @body_class = 'job_page'

    @company = Company.new
  end

  def edit
    @page_title = 'Company'
    @body_class = 'job_page'

    @company = Company.where(id: params[:id]).first

    unless @company.user == current_user
      redirect_to jobs_path
      return false
    end
  end

  def save
    if params[:company][:id].present?
      @company = Company.where(id: params[:company][:id]).first
      @company.update(permitted_params)

      unless @company.user == current_user
        redirect_to jobs_path
        return false
      end
    else
      company_params = permitted_params
      company_params[:user_id] = current_user.id

      @company = Company.new(company_params)
    end
    
    if @company.save!
      flash[:alert] = 'Save successful :D'
    else
      flash[:alert] = 'Save unsuccessful :/'
    end
    
    redirect_to company_path
  end

  def delete
    @company = Company.where(id: params[:id]).first

    unless @company.user == current_user
      redirect_to jobs_path
      return false
    end

    @company.delete

    redirect_to company_path
  end

  private

  def permitted_params
    params.require(:company).permit(:name,:notes,:location,:url,:user_id)
  end
end
