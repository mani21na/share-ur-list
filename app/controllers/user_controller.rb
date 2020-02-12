class UserController < ApplicationController
  def new
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
  end

  private
 
  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
