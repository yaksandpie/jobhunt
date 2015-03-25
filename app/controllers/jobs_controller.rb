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
end
