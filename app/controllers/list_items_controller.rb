class ListItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    task = current_user.tasks.where(id: params[:task_id]).first
    list_item = task.list_items.new

    render 'list_items/new', locals: { list_item: list_item }
  end

  def create
    task = current_user.tasks.where(id: params[:task_id]).first
    list_item = task.list_items.new(list_item_params)

    if list_item.save
      redirect_to task_path(list_item.task)
    else
      flash.now[:error] = "There was an error saving your list item. Please review the form and try again"
      render 'list_items/new', locals: { list_item: list_item }
    end
  end

  def edit
    task = current_user.tasks.where(id: params[:task_id]).first
    list_item = task.list_items.where(id: params[:id]).first

    render 'list_items/edit', locals: { list_item: list_item }
  end

  def update
    task = current_user.tasks.where(id: params[:task_id]).first
    list_item = task.list_items.where(id: params[:id]).first

    if list_item.update_attributes(list_item_params)
      redirect_to task_path(list_item.task)
    else
      flash.now[:error] = "There was an error saving your list item. Please review the form and try again"
      render 'list_items/edit', locals: { list_item: list_item }
    end
  end

  def destroy
    task = current_user.tasks.where(id: params[:task_id]).first
    list_item = task.list_items.where(id: params[:id]).first

    task = list_item.task

    if !list_item.destroy
      flash[:error] = "There was an error destroying your list item. Please try again"
    end

    redirect_to task_path(task)
  end

  private

  def list_item_params
    params.require(:list_item).permit(:description, :priority, :complete)
  end
end