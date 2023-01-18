class UsersController < ApplicationController
  before_action :find, except: [:new, :create]
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'users/new'
    end
  end

  def edit
  end

  def update
    if @user.update(set_params)
      redirect_to user_path(@user.id)
    else
      render 'users/edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private
  def find
    @user = User.find(params[:id])
  end

  def set_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
