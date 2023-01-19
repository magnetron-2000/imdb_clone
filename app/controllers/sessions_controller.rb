  class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user_url(user)
    else
      render 'sessions/new' #TODO add flesh warning in session, users, movie controllers
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
