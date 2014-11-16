class ListsController < ApplicationController
  
  # def index
  #   @lists = List.visible_to(current_user)
  # end

  def new
    @list = List.new
  end

  def create
    #associate the new list with a user
    @list = List.new(user_id: current_user.id)
    if @list.save
      flash[:notice] = "Your to do list was created."
      redirect_to @list
    else
      flash[:error] = "There was an error creating your list. Please try again."
      render :new
    end
  end

  def show
    # show current user's list
    #Render a form that will collect useful params to create a new Todo (GET)
    @user = current_user
    @list = List.find(params[:id])
    @todo = Todo.new
    @todos = @list.todos
  end
end
