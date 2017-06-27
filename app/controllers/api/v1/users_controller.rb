# frozen_string_literal: true

module Api::V1
  class UsersController < ApiController
  	before_action :authenticate

    def show
      @user = User.includes(:raffles).find(params[:id])
    end
  end
end
