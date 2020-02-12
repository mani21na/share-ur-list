class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
