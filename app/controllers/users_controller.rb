class UsersController < ApplicationController

  def index
    render locals: { users: User.all }
  end

  def show
    render locals: { user: User.find(params[:id]) }
  end

  def new
    render locals: { user: User.new }
  end

  def edit
    render locals: { user: User.find(params[:id]) }
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to user, notice: 'User was successfully created.'
    else
      render :new, locals: { user: user }
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      redirect_to user, notice: 'User was successfully updated.'
    else
      render :edit, locals: { user: user }
    end
  end

  # DELETE /users/1
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end
end
