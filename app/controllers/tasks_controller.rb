class TasksController < ApplicationController
  before_action :task_joins, except: [:create]

  def create
    @project = current_user.projects.find(params[:task][:project_id])
    @task = @project.tasks.create task_params
    @task.save
    redirect_to :root
  end

  def destroy
    @task.destroy
    redirect_to :root
  end

  def complete
    @task.update_attribute(:done, true || false)
    redirect_to :root
  end

  def update
    @task.update(task_params)
    redirect_to :root
	end

  def deadline
    current_task.add(params[:deadline])
    redirect_to :root
  end

  private

  def task_joins
    @task = Task.joins(:project).where('projects.user_id' => current_user.id, 'tasks.id' => params[:id]).first
  end

  def task_params
    params.require(:task).permit(:name, :done, :project_id, :deadline)
  end
end
