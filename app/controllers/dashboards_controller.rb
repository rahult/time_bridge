class DashboardsController < ApplicationController

  def show
    unless current_user.default_project_id.blank?
      @stories = Project.find_by_id(current_user.default_project_id).stories.where("user_id = ?", current_user).active
    end
  end

end
