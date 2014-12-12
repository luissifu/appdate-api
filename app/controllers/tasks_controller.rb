class tasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tasks = task.all
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  def new
    @task = task.new
    respond_with(@task)
  end

  def edit
  end

  def create
    @task = task.new(task_params)
    @task.save
    respond_with(@task)
  end

  def update
    @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  private
  def set_task
    @task = task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :desc, :deadline, :category)
  end
end
