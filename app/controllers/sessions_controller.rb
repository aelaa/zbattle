class SessionsController < ApplicationController

  def new
  end

  def create
    if user = login(params[:login])
      session[:user] = user.id

      if user.admin?
        redirect_to root_path
      else
        redirect_to root_path
      end
    else
      render :new, locals: { errors: 'Пользователь не найден' }
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
