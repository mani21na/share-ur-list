class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :update, :destroy, :show]
  before_action :set_user_id
  before_action :require_login
  before_action :require_login

  def new
    @list = List.new
    @num = 0
    10.times do
      @num += 1
      @list.items.build(item_no: "#{@num}")
    end
  end

  def create
    @list = List.new(list_params)
    if @list.valid?
      @list.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to user_path(current_user.id)
    else 
       render :edit
    end
  end

  def destroy
    @list.items.destroy
    @list.destroy
    redirect_to user_path(current_user.id)
  end

  def show
  end

  private 

  def set_list
    @list = List.find(params[:id])
  end
  
  def set_user_id
    @user_id = current_user.id
  end

  def list_params
    params.require(:list).permit(:user_id, :subject, items_attributes: [:item_no, :item, :quantity, :done, :id, '_destroy'])
  end 
end
