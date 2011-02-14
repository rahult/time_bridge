class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :check_user_profile_for_completeness

  protected
    def check_user_profile_for_completeness
      unless params[:controller].eql?("settings")
        if user_signed_in?
          if current_user.is_not_integrated?
            flash[:notice] = "You have to complete your profile in order to continue."
            redirect_to edit_setting_path(current_user)
          end
        end
      end
    end
end
