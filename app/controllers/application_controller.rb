class ApplicationController < ActionController::Base
  # methods for devise redirect after successful sign in or sign up.
  # sometimes these methods need to be in a RegistrationsController which inherits from Devise::RegistrationsController
  # ^^ no idea why sometimes one works, sometimes the other.

  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
end
