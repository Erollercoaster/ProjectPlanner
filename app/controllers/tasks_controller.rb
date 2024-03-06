class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @category.tasks
  end

  def show
  end

  def new
    @task = @category.tasks.new
  end

  def create
    @category = Category.find(params[:category_id]) # Retrieve the category
    @task = @category.tasks.build(task_params) # Build a new task associated with the category
    @task.user = current_user # Assign the current user to the task
  
    if @task.save
      redirect_to category_tasks_path(@category), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to category_tasks_path(@category), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to category_tasks_path(@category), notice: 'Task was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_task
    @task = @category.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end
end