class UserController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @user = User.find[params[:id]]
  end

  private
 
  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
