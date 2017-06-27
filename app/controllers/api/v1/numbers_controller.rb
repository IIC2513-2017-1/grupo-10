module Api::V1
  class NumbersController < ApiController
    include Seller
    before_action :authenticate

    def create
      @raffle = Raffle.find params[:raffle_id]
      return if sell(@raffle, params[:numbers])
      # TODO: Fix feedback on error
      render json: { errors: @number.errors }, status: :unprocessable_entity
    end
  end
end

