class ProjectsController < ApplicationController
  before_action :get_project, only: [:show, :edit, :update, :destroy]
  before_action :get_images, only: [:show, :edit, :update, :destroy]
  before_action :verify_logged_in, only: [:new, :create, :edit, :update,:destroy]
  before_action :verify_user, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = "Project added."
      redirect_to projects_path
    else
      flash[:error] = "Project has not been added."
      render projects_path
    end
  end

  def show
    @image = Image.new
    @image.project = @project
  end

  def edit
  end

  def update
    @project.update_attributes(project_params)

    if @project.save
      flash[:success] = "Project updated successfully."
      redirect_to @project
    else
      flash[:error] = "Project has not been updated."
      render :edit
    end
  end

  def destroy
    if @project.destroy
      flash[:success] = "Project deleted successfully."
      redirect_to projects_path
    else
      flash[:error] = "Project has not been deleted."
      redirect_to @project
    end
  end

  private

  def get_project
    @project = Project.find(params[:id])
  end

  def get_images
    @images = Image.where(:project_id => params[:id])
  end

  def verify_logged_in
    unless user_signed_in?
      flash[:error] = 'You must be logged in.'
      redirect_to new_user_session_path
    end
  end

  def verify_user
    unless params[:project] && params[:project][:flagged] || params[:action] != "destroy"
      unless @project.owner == current_user || current_user.admin
        flash[:error] = 'You are not authorized to perform this action.'
        redirect_to :back
      end
    end
  end

  def project_params
    params.require(:project).permit(:title,:summary)
  end

end
