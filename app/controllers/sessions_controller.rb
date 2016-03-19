class SessionsController < ApplicationController
  def new
  end

  def create
     @user = login( params[:session][:email], params[:session][:password],params[:session][:remember_me])
     if @user
      redirect_back_or_to(root_path)
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_back_or_to(root_path)
  end
end


