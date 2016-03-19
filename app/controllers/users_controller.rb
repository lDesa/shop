class UsersController < ApplicationController
  
  #root_path
  def index
  	
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Success singup!"
      redirect_to root_url

    else
      render 'new'
    end
  end



  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
