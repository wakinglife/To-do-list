



class TodosController < ApplicationController
  before_action :set_todo, :only => [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.all.order("due_date DESC")
  end


  def new
    @todo = Todo.new
  end
  def create
      @todo = Todo.new(todo_params)
    #  @todo.is_completed = false
      if @todo.save
        redirect_to todos_url
      else
        render :new
      end
    end

    def update

      if @todo.update_attributes(todo_params)
        redirect_to todo_path(@todo)
      else
        render :edit
      end
    end

    def destroy
      if @todo.can_destroy?
        @todo.destroy
        flash[:alert] = 'Task was successfully deleted !!'
        redirect_to todos_url
      else
          flash[:alert] = 'Task is overdue, can not be deleted !!'
          redirect_to todos_url
      end
    end

    def is_check
      @todo.update(check: !(@todo.check))
    end

    def done

        @todo.done = true
        @todo.save

        redirect_to todos_path
      end

      def not_yet

        @todo.done = false
        @todo.save

        redirect_to todos_path
      end


    private
    def set_todo
      @todo = Todo.find(params[:id])
    end


    def todo_params
      params.require(:todo).permit(:name, :due_date, :note, :done)
    end


end
