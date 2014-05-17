class ProjectsController < ApplicationController

  before_filter :authenticate

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    render :file => 'public/404.html', :status => :not_found, :layout => false
  end

  def update

  end

  def destroy
    @project.destroy(params[:id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: 'Project added successfully'
    else
      render 'new'
    end
  end
  
  protected

  def authenticate
    if request.subdomain == 'admin'
      authenticate_or_request_with_http_basic("Administration") do |user,pass| user == ENV["WEBSITE_USERNAME"] && pass = ENV["WEBSITE_PASSWORD"] end 
    end
  end

  def project_params
    params.require(:project).permit(:name, :year, :link, :description)
  end
end
