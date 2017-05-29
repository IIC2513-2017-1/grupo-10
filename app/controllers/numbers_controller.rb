# frozen_string_literal: true

class NumbersController < ApplicationController
  include Seller
  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def create
    @raffle = Raffle.find params[:raffle_id]
    if params[:numbers].blank?
      redirect_to @raffle, alert: 'No number selected'
    else
      respond_to do |format|
        if sell(@raffle, params[:numbers])
          format.html do
            redirect_to raffle_path(@raffle),
                        notice: 'Numbers was successfully bought.'
          end
          format.json { render :show, status: :created, location: @raffle }
        else
          format.html { redirect_to @raffle, alert: 'Purchased failed' }
          format.json do
            render json: number.errors,
                   status: :unprocessable_entity
          end
        end
      end
    end
  end

  def destroy
    number = Number.find(params[:id])
    raffle = number.raffle
    number.destroy
    respond_to do |format|
      format.html do
        redirect_to raffle_path(raffle),
                    notice: 'Raffle was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end
end
