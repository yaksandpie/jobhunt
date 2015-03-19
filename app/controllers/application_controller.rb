class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def show_404
    render 'pages/error404'
  end

  def after_sign_in_path_for(resource)
    jobs_path
  end
end
