# frozen_string_literal: true

class PrizesController < ApplicationController
  before_action :set_raffle

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength

  def new
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def create
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

  def set_raffle
    @raffle = Raffle.find params[:raffle_id]
  end

  def prize_params
    params.require(:prize).permit(:name, :description, :image)
  end
end
