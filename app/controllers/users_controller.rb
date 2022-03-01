class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new    
  end

  def show
    @user = User.find(params[:id])
    @favorites = @user.favorites
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end
end
