class TasksController < ApplicationController

  def create
    project = current_user.projects.find(params[:task][:project_id])
    @task = project.tasks.create task_params
    if @task.save
      flash[:success] = 'Task has been created!'
    else
      flash[:error] = 'Task is not created!'
    end
    redirect_to :root
  end

  def destroy
    task = Task.joins(:project).where('projects.user_id' => current_user.id, 'tasks.id' => params[:id]).first
    if task && task.destroy
      flash[:success] = 'Task has been removed!'
    else
      flash[:error] = 'Task is not removed!'
    end
    redirect_to :root
  end

  def complete
    task = Task.joins(:project).where('projects.user_id' => current_user.id, 'tasks.id' => params[:id]).first
    task.update_attribute(:done, true || false)
    flash[:notice] = 'Task has been completed!'
    redirect_to 'index'
  end

  def update
    task = Task.joins(:project).where('projects.user_id' => current_user.id, 'tasks.id' => params[:id]).first
    if task.update task_params
      flash[:success] = 'Task has been updated!'
		else
      flash[:success] = 'Task is not updated!'
		end
    redirect_to :root
	end

  def deadline
    task = Task.joins(:project).where('projects.user_id' => current_user.id, 'tasks.id' => params[:id]).first
    current_task.add(params[:deadline])
    redirect_to :root
  end

  private

  def task_params
    params.require(:task).permit(:name, :done, :project_id, :deadline)
  end

end
