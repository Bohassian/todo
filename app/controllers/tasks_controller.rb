class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    tasks = current_user.tasks.includes(:list_items)

    render 'tasks/index', locals: { tasks: tasks }
  end

  def show
    task = current_user.tasks.find_by(id: params[:id])

    render 'tasks/show', locals: { task: task }
  end

  def new
    task = current_user.tasks.new

    render 'tasks/new', locals: { task: task }
  end

  def create
    task = current_user.tasks.new(task_params)

    if task.save
      redirect_to task_path(task)
    else
      flash.now[:error] = "There was an error saving your task. Please review the form and try again"
      render 'tasks/new', locals: { task: task }
    end
  end

  def edit
    task = current_user.tasks.find_by(id: params[:id])

    render 'tasks/edit', locals: { task: task }
  end

  def update
    task = current_user.tasks.find_by(id: params[:id])

    if task.update_attributes(task_params)
      redirect_to task_path(task)
    else
      flash.now[:error] = "There was an error saving your task. Please review the form and try again"
      render 'tasks/edit', locals: { task: task }
    end
  end

  def destroy
    task = current_user.tasks.find_by(id: params[:id])

    if !task.destroy
      flash[:error] = "There was an error destroying your task. Please try again"
    end

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end