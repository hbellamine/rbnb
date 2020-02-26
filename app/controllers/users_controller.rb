class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def puppies
    @puppies = Puppie.where(user_id: current_user)

    @puppies = policy_scope(puppies).order(created_at: :desc)
  end



  def update
  end

  def destroy
  end
end
