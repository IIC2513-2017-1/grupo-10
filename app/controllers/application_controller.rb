# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_time
  helper_method :current_user

  def set_time
    @time = Time.now
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end
end
