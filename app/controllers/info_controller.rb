class InfoController < ApplicationController

before_action :signed_in_user, only: [:create, :destroy, :edit, :update]
 before_action :correct_user,   only: [:destroy, :edit, :update]

  def create
    @info = current_user.create(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def edit
    @micropost = current_user.microposts.find(params[:id])
  end
  
  def update
    @micropost = current_user.microposts.find(params[:id])
    if @micropost.update_attributes(micropost_params)
      flash[:success] = "Profile updated"
      redirect_to edit_micropost_path
    else
      render 'root_url'
    end
  end
  
 def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end











end
