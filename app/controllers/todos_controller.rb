class TodosController < ApplicationController

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

  def create#Sole responsibility is to store params as a Todo into the database (POST)
    #You have access to params[:list_id]

=begin
Your immediate goal is to make todos save with a list_id.  Everything else is a distraction.
DID IT. Now why isn't it showing on the right list...?
=end

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
     @list = List.find(params[:id])
     @todo = Todo.find(params[:id])
 
     if @todo.destroy
       flash[:notice] = "\"#{description}\" was deleted successfully."
       redirect_to @list
     else
       flash[:error] = "There was an error deleting the to do."
       redirect_to @list
     end
  end

end