class PositionsController < ApplicationController
  before_action :authenticate_user!

  def add
    @page_title = 'Position'
    @body_class = 'job_page'

    @position = Position.new
    @companies = current_user.companies.reverse
  end

  def edit
    @page_title = 'Position'
    @body_class = 'job_page'

    @position = Position.where(id: params[:id]).first

    unless @position.company.user == current_user
      redirect_to jobs_path
      return false
    end

    @companies = current_user.companies
  end

  def save
    if params[:position][:id].present?
      @position = Position.where(id: params[:position][:id]).first
      @position.update(permitted_params)

      unless @position.company.user == current_user
        redirect_to jobs_path
        return false
      end
    else
      @position = Position.new(permitted_params)
    end
    
    if @position.save!
      flash[:alert] = 'Save successful :D'
      redirect_to jobs_path
    else
      flash[:alert] = 'Save unsuccessful :/'
      redirect_to jobs_path
    end
  end

  def delete
    @position = Position.where(id: params[:id]).first

    unless @position.company.user == current_user
      redirect_to jobs_path
      return false
    end

    @position.delete

    redirect_to jobs_path
  end

  def applied_for
    Position.update(params[:position_id], :date_applied => Date.today)
    redirect_to jobs_path
  end

  private

  def permitted_params
    params.require(:position).permit(:title,:url,:notes,:date_applied,:applied_for,:company_id)
  end
end
