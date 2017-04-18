class ImagesController < ApplicationController
  before_action :get_image, only: [:show, :edit, :update, :destroy]
  before_action :verify_logged_in, only: [:new, :create, :edit, :update,:destroy]

  def new
    @image = Image.new
    @image.project_id = params[:project_id]
  end

  def create
    @image = Image.new(image_params)
    @image.project_id = params[:project_id]

    if @image.save
      flash[:success] = "Image added."
      redirect_to project_path(@image.project)
    else
      flash[:error] = "Image has not been added."
      render project_path(@image.project)
    end
  end

  def show
  end

  def edit
  end

  def update
    @image.update_attributes(image_params)
    set_false if @image.is_primary == true

    if @image.save
      flash[:success] = "Image updated successfully."
      redirect_to @image.project
    else
      flash[:error] = "Image has not been updated."
      redirect_to @image.project
    end
  end

  def destroy
    if @image.destroy
      flash[:success] = "Image deleted successfully."
      redirect_to @image.project
    else
      flash[:error] = "Image has not been deleted."
      redirect_to @image.project
    end
  end

  private

  def get_image
    @image = Image.find(params[:id])
  end

  def verify_logged_in
    unless user_signed_in?
      flash[:error] = 'You must be logged in.'
      redirect_to new_user_session_path
    end
  end

  def image_params
    params.require(:image).permit(:image,:is_primary,:caption)
  end

  def set_false
    images = Image.where(project_id: @image.project_id)
    images.each do |image|
      if image != @image
        image.is_primary = false
        image.save
      end
    end
  end

end
