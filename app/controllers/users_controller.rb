class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    redirect_to root_path
    authorize current_user
  end

  def update
  end

  def destroy
    authorize current_user
  end
end
