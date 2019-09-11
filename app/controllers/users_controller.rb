class UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
    @user = User.find(current_user.id)
    render "users/#{params[:name]}"
    # , locals: {user: current_user }
  end


  def pay
    
  end
end
