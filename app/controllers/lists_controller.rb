class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :update, :destroy, :show]
  before_action :require_login

  def new
    @list = List.new
    @user_id = current_user.id
    @num = 0
    10.times do
      @num =+ 1
      @list.items.build(item_no: "#{@num}")
    end
  end

  def create
    @list = List.new(list_params)
    if @list.valid?
      @list.save
      redirect_to lists_path
    else 
      @user_id = current_user.id
      @num = 0
      10.times do
        @num =+ 1
        @list.items.build(item_no: "#{@num}")
      end
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

  def index
    @list = List.all.find_all{ |list| list.find_by(:user_id => params[:id]) }
binding.pry
  end

  private 

  def set_list
    @list = List.find(params[:id])
  end 

  def list_params
    params.require(:list).permit(:user_id, :subject, item_no_attributes: [:item, :quantity, :done])
  end 
end
