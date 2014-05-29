class ProjectsController < ApplicationController

  before_filter :authenticate, :set_projects

  def index
    @project = Project.new
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def update

  end

  def destroy
    Project.find(params[:id]).destroy
    respond_to do |format|
      format.js { }
    end
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        flash.now[:notice] = 'Project added successfully'
        format.html { redirect_to projects_path }
        format.js { }
      else
        @created = false
        format.html { render 'new' }
        format.js { render 'create.js.haml' }
      end
    end
  end

  protected

  def authenticate
    if request.subdomain == 'admin'
      authenticate_or_request_with_http_basic("Administration") do |user,pass| user == ENV["WEBSITE_USERNAME"] && pass = ENV["WEBSITE_PASSWORD"] end
    end
  end

  def set_projects
    @projects = Project.all
  end

  def project_params
    params.require(:project).permit(:name, :year, :link, :description)
  end
end
