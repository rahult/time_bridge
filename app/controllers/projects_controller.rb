class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @title = "Pivotal Tracker - Project List"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end
end
