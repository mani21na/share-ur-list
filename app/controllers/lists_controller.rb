class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :update, :destroy, :show]
  before_action :require_login

  def new
    binding.pry
    @list = List.new
    @num = 0
    5.times do
      num =+ 1
      @list.list.build(name_num: "#{num}")
    end
  end

  def create
    @list = List.new
    @num = 0
    5.times do
      num =+ 1
      @list.list.build(name_num: "#{num}")
    end
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

  def show
  end

  def index
    @list = List.all.find_all{ |list| list.find_by(:user_id => params[:id]) }
  end

  private 

  def set_list
    @list = List.find(params[:id])
  end 

  def list_params
    params.require(:list).permit(:subject, name_num: [:item, :done])
  end 
end
