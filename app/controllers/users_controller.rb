class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update, :followings, :followers]

  def show
    @user = User.find(params[:id])
    @pagy, @posts = pagy(@user.posts.order(id: :desc))
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Registered!'
      redirect_to @user
    else
      flash.now[:danger] = 'Failed.'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Edited.'
      render :edit
    else
      flash.now[:danger] = 'Failed.'
      render :edit
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @pagy, @followings = pagy(@user.followings)
    counts(@user)
  end

  def followers
    @user = User.find(params[:id])
    @pagy, @followers = pagy(@user.followers)
    counts(@user)
  end
  
  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.all
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduce, :skill)
  end
end
