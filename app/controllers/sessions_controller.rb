# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    redirect_to user_path current_user if session[:user_id].present?
  end

  def create
    user = User.find_by username: params[:username]
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: 'Successful login'
    else
      session[:user_id] = nil
      redirect_to login_path,
                  flash: { error: 'Username or password is incorrect' }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to raffles_path, notice: 'Successful logout'
  end
end
