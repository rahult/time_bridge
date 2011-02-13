class StoriesController < ApplicationController
  before_filter :load_project, :except => :all

  def all
    @stories = current_user.stories.all

    respond_to do |format|
      format.html { render :index }
      format.xml  { render :xml => @stories }
    end
  end

  def index
    @stories = @project.stories.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @stories }
    end
  end

  def show
    @story = @project.stories.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @story }
    end
  end

  def log
    @story = @project.stories.find(params[:id])
    stop_all_other_logs
    @story.time_logs.create(:start_time => Time.now, :end_time => nil)
    flash[:notice] = "Started logging time"
    redirect_to all_stories_path
  end

  def stop
    @story = @project.stories.find(params[:id])
    stop_all_other_logs
    flash[:notice] = "Stopped logging time"
    redirect_to all_stories_path
  end

  protected
    def load_project
      @project = Project.find(params[:project_id])
    end

    def stop_all_other_logs
      time_logs = TimeLog.where(:end_time => nil)
      time_logs.each do |log|
        log.update_attribute(:end_time, Time.now)
      end
    end
end
