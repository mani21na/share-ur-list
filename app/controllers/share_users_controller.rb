class ShareUsersController < ApplicationController
  before_action :set_share_users, only: [:edit, :update, :destroy, :show]
  before_action :current_list, only: [:new, :search, :create, :index, :destroy]
  before_action :require_login

  def new 
    if params[:search].blank?  
      redirect_to(list_user_search_path(params[:list_id]), alert: "Empty field!") and return 
      #redirect_to(root_path, alert: "Empty field!") and return  
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
      #flash.now[:error] = "#{params[:username]} does not exist or is already added."
      redirect_to list_user_search_path(params[:list_id], alert: "The user does not exist or is already added.")
    end
  end

  def destroy
    @share_user.destroy
    redirect_to list_path(@list.id)
  end

  def show
  end
    
  private

  def share_users_params
    params.require(:share_user).permit(:user_id, :list_id, :username, :search)
  end

  def set_share_users
    @share_user ||= ShareUser.find(params[:id])
  end

  def current_list
    @list ||= List.find(params[:list_id].to_i)
  end
end
