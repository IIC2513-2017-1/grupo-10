module Api::V1
  class RafflesController < ApiController
    before_action :authenticate

    def index
      @raffles = Raffle.all
    end

    def create
      @raffle = @current_user.raffles.build(raffle_params)
      return if @raffle.save
      render json: { errors: @raffle.errors }, status: :unprocessable_entity
    end

    def show
      @raffle = Raffle.includes(:numbers).find(params[:id])
    end

    private

      def raffle_params
        raffle_param = params.require(:raffle).permit(
          :description, :title,
          :price, :number_amount, :private
        )
        raffle_param[:organizator] = @current_user
        raffle_param[:start_date] = DateTime.parse(
          "#{params[:start_date]} #{params[:start_time]}"
        )
        raffle_param[:end_date] = DateTime.parse(
          "#{params[:end_date]} #{params[:end_time]}"
        )
        raffle_param
      end
  end
end