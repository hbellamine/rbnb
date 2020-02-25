class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def puppies
    @puppies = Puppie.select { |p| p.user_id == params[:user_id] }
    @puppies = policy_scope(Puppie).order(created_at: :desc)
    render 'users/puppies'
  end



  def update
  end

  def destroy
  end
end
