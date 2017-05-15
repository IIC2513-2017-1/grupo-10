# frozen_string_literal: true

class PrizesController < ApplicationController
  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def create
    @raffle = Raffle.find params[:raffle_id]
    prize = @raffle.prizes.build prize_params

    respond_to do |format|
      if prize.save
        format.html do
          redirect_to raffle_path(@raffle),
                      notice: 'Prize was successfully created.'
        end
        format.json { render :show, status: :created, location: @raffle }
      else
        format.html do
          redirect_to raffle_path(@raffle),
                      flash: { error: 'Couldn\'t create prize' }
        end
        format.json do
          render json: prize.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  private

  def prize_params
    params.require(:prize).permit(:name, :description, :image)
  end
end
