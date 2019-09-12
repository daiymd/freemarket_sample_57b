class UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    render "users/#{params[:name]}"
    # , locals: {user: current_user }
  end


  def pay
    
  end
end
