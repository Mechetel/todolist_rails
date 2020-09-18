class PublicController < ApplicationController
  def index
  end

  def profile
    @profile = User.find_by_username params[:username]
  end
end
