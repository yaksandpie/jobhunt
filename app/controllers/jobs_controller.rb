class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @page_title = "Jobs Central"
    @body_class = "job_page"

    # get all the companies
    @companies = current_user.companies

    @positions = Position.where(company_id: @companies.pluck(:id))

    # get the new positions. i.e. those without a date applied
    @new_positions = @positions.where(date_applied: nil, rejected: false)

    # get the positions we've applied for
    @applied_for_positions = @positions.where(rejected: false).where.not(date_applied: nil)

    #get the positions that we got denied. those companies don't know what they're missing.
    @positions_rejected = @positions.where(rejected: true)

    # get all the interviews
    @interviews = Interview.where(position_id: @applied_for_positions.pluck(:id))
    
  end

  def position
    @page_title = 'Position'
    @body_class = 'job_page'

    @position = Position.new
    @companies = current_user.companies
  end

  def create_position
  	@position = Position.new(position_params)

  	if @position.save!
  	  flash[:alert] = 'Save successful :D'
  	  redirect_to jobs_url
  	else
  	  flash[:alert] = 'Save unsuccessful :/'
  	  redirect_to 'position'
  	end
  end

  private

  def position_params
    params.require(:position).permit(:title,:url,:notes,:date_applied,:applied_for,:company_id)
  end
end
