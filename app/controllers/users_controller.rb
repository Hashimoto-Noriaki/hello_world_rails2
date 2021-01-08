class UsersController < ApplicationController
  def index
  binding.pry
    @users = User.all
  render json: @users
  end

  def show
  
    @user = User.find(params[:id])
  end
end

