class SettingsController < ApplicationController
  def edit
    @user = User.find(current_user)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to root_path
    else
      render :action => "edit"
    end
  end

  def sync
    begin
      SyncPivotal.new(current_user).sync_projects
      flash[:notice] = "Your account has been synced with Pivotal Tracker"
      redirect_to root_path
    rescue Exception => e
      flash[:notice] = "Something went wrong while importing data from Pivotal Tracker using this token '#{User.find(current_user).pivotal_token}'"
      redirect_to edit_setting_path(current_user)
    end
  end
end
