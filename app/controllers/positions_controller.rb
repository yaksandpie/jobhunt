class PositionsController < ApplicationController
  before_action :authenticate_user!

  def add
    @page_title = 'Position'
    @body_class = 'job_page'

    @position = Position.new
    @companies = current_user.companies
  end

  def create
    @position = Position.new(permitted_params)

    if @position.save!
      flash[:alert] = 'Save successful :D'
      redirect_to jobs_url
    else
      flash[:alert] = 'Save unsuccessful :/'
      redirect_to 'position'
    end
  end

  private

  def permitted_params
    params.require(:position).permit(:title,:url,:notes,:date_applied,:applied_for,:company_id)
  end
end
