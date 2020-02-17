class ShareUsersController < ApplicationController
  before_action :set_share_users, only: [:edit, :update, :destroy, :show]
  before_action :current_list, only: [:new, :search, :create, :index]
  before_action :require_login

  def new 
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    end   
      @share_user = @list.share_users.build  
      @user = User.search_users_by_username(params[:search]).first
        
      @share_user.user_id = @user.id
  end

  def search 
  end

  def create
    @share_user = @list.share_users.build(share_users_params)
    if @share_user.save
      redirect_to list_path(@list.id)
    else
      redirect_to new_list_share_user_path(params[:list_id])
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

  def index
    binding.pry
    @share_users = @list.share_users
  end

  private

  def share_users_params
    params.require(:share_user).permit(:user_id, :list_id, :username, :search)
  end

  def set_share_users
    @share_user = ShareUser.find(params[:id])
  end

  def current_list
    @list = List.find(params[:list_id].to_i)
  end
end
