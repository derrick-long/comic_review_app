class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:destroy, :index]

  def index
    @users = User.all
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User deleted"
    redirect_to users_url
  end


private
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
