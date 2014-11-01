class ListsController < ApplicationController
  def show
    @lists = List.all
    #@list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def index
    @lists = List.visible_to(current_user)
  end

  def create
    @list = List.new(params.require(:list).permit(:user_id))
    if @list.save
      flash[:notice] = "Your to do list was created."
      redirect_to @list
    else
      flash[:error] = "There was an error creating your list. Please try again."
      render :new
    end
  end
end
