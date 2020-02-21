class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :show]
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save

      session[:user_id] = @user[:id]

      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def show
    @lists_shared = List.joins(:share_users).where(share_users: { user_id: session[:user_id] })
  end

  def search 
    @users = User.search_users_by_username(params[:search])
  end

  #Shared lists by others
  def index
    @lists_shared = ShareUser.find_by(user_id: session[:user_id])
  end

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    #where(email: auth.info.email).first_or_initialize do |user|
    #  user.name = auth.info.name
    #  user.email = auth.info.email
    #end
  end

  private
  
  def user_params
    params.require(:user).permit(
      :username, 
      :password, 
      :password_confirmation, 
      :first_name, 
      :last_name, 
      :search
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
