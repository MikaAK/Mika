class ProjectsController < ApplicationController


  http_basic_authenticate_with :name => ENV["WEBSITE_USERNAME"],
                               :password => ENV["WEBSITE_PASSWORD"],
                               :only => ['edit', 'destroy', 'new'] if Rails.env.production?

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show

  end

  def edit

  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: 'Project added successfully'
    else
      render 'new'
    end
  end

  def project_params
    params.require(:project).permit(:name, :year, :link, :description)
  end
end
