class PublicController < ApplicationController
  def index
    @projects = current_user.projects.all
  end

  def profile
    @profile = User.find_by_username params[:username]
  end
end
