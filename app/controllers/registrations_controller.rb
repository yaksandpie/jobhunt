class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    jobs_path
  end

  def after_sign_out_path_for(resource)
    jobs_path
  end
end