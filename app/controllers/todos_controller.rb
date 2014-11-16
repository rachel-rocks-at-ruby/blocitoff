class TodosController < ApplicationController
  respond_to :html, :js

  def new#Render a form that will collect useful params (GET)
    @todo = Todo.new
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params.require(:todo).permit(:description, :time_left, :complete))
    if @todo.save
      flash[:notice] = "Your to do was added."
      redirect_to @list
    else
      flash[:error] = "There was an error creating your to do. Please try again."
      render :new
    end
  end

  def create
  #Sole responsibility is to store params as a Todo into the database (POST)

    @list = List.find(params[:list_id])
    @todo = Todo.new(params.require(:todo).permit(:description, :time_left, :complete))
    @todo.list = @list

    if @todo.save
      flash[:notice] = "Your to do was added."
      redirect_to @todo.list
    else
      flash[:error] = "There was an error creating your to do. Please try again."
      render :new
    end
  end

  def destroy
    #you have params: list_id and id
     @list = List.find(params[:list_id])
     @todo = Todo.find(params[:id])
 
     if @todo.destroy
       flash[:notice] = "\"#{@todo.description}\" was deleted successfully."
     else
       flash[:error] = "There was an error deleting the to do."
     end

     respond_with(@todo) do |format|
       format.html { redirect_to @todo.list }
     end
  end

end