class UsersController < ApplicationController
  before_action :check_current_user, only: [:edit, :update]

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
    render locals: { user: current_user }
  end

  def create
    user = User.new(user_params)

    if user.save
      force_login(user)
      redirect_to root_path, notice: 'Добро пожаловать, ' + user.name
    else
      render :new, locals: { user: user }
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to current_user, notice: 'User was successfully updated.'
    else
      render :edit, locals: { user: current_user }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :login, :password, :city)
  end
end
