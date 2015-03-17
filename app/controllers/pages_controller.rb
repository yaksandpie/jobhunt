class PagesController < ApplicationController
  def home
    @page_title = "Home"
  end

  def error404
    show_404
  end
end
