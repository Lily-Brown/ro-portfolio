class ImagesController < ApplicationController
  before_action :get_image, only: [:show, :edit, :update, :destroy]
  # before_action :verify_logged_in, only: [:create, :update,:destroy]
  # before_action :verify_user, only: [:edit, :update, :destroy]

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

    if @image.save
      flash[:success] = "Image updated successfully."
      redirect_to @image
    else
      flash[:error] = "Image has not been updated."
      render :edit
    end
  end

  def destroy
    if @image.destroy
      flash[:success] = "Image deleted successfully."
      redirect_to images_path
    else
      flash[:error] = "Image has not been deleted."
      redirect_to @image
    end
  end

  private

  def get_image
    @image = Image.find(params[:id])
  end

  # def verify_logged_in
  #   unless user_signed_in?
  #     flash[:error] = 'You must be logged in.'
  #     redirect_to new_user_session_path
  #   end
  # end

  # def verify_user
  #   unless params[:image] && params[:image][:flagged] || params[:action] != "destroy"
  #     unless @image.owner == current_user || current_user.admin
  #       flash[:error] = 'You are not authorized to perform this action.'
  #       redirect_to :back
  #     end
  #   end
  # end

  def image_params
    params.require(:image).permit(:image,:caption)
  end

end
