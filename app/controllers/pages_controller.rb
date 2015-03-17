class PagesController < ApplicationController
  def home
    @page_title = "Home"
    @body_class = "home_page"

    @positions = Position.all

  end

  def error404
    show_404
  end
end
