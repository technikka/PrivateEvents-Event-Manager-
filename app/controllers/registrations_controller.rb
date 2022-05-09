class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resources)
    new_user_session_path
  end
end