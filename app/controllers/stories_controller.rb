class StoriesController < ApplicationController
  before_filter :load_project, :except => :all

  def all
    @stories = Story.all

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

  protected
    def load_project
      @project = Project.find(params[:project_id])
    end
end
