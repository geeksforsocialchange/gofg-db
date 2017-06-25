class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
       render format :js
    else

    end
  end

  def user_params
    params.require(:users).permit(:email)
  end
end
