class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :update, :destroy, :show]
  before_action :set_user_id
  before_action :set_nested_attributes, only: [:new, :create, :show, :edit, :update]
  before_action :set_items, only: [:show, :edit]
  before_action :require_login

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.valid?
      @list.save
      redirect_to lists_path
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

  #error! => items are not showing
  def show
    @num = 0
    @items  = set_list.items
    10.times do
      @num =+ 1
      @list.items.build(item_no: "#{@num}")
    end
  end

  #def index
  #  @lists = List.all.find_all{ |list| list.user_id == current_user.id }
  #end

  private 

  def set_list
    @list = List.find(params[:id])
  end
  
  def set_user_id
    @user_id = current_user.id
  end

  def list_params
    params.require(:list).permit(:user_id, :subject, item_no_attributes: [:item, :quantity, :done])
  end 

  def set_nested_attributes
    @num = 0
    10.times do
      @num =+ 1
      @list.items.build(item_no: "#{@num}")
    end
  end

  def set_items
    @items  = set_list.items
  end
end
