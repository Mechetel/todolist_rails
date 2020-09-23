class ProjectsController < ApplicationController
  before_action :set_project, except: [:create]

  def create
    @project = current_user.projects.new project_params
    @project.save
    redirect_to :root
  end

  def destroy
    @project.destroy
    redirect_to :root
  end

  def update
    @project.update project_params
    redirect_to :root
  end

  def update_tasks_order
    params[:order].each.with_index do |task_id, index|
      @project.tasks.update(task_id, { order: index })
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def set_project
    @project = current_user.projects.find(params[:id])
  end
end
