# frozen_string_literal: true

class NumbersController < ApplicationController
  def new
    @users = User.all
    @raffle = Raffle.find params[:raffle_id]
    @number = Number.new
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def create
    @raffle = Raffle.find params[:raffle_id]
    number = @raffle.numbers.build number_params

    respond_to do |format|
      if number.save
        format.html do
          redirect_to raffle_path(@raffle),
                      notice: 'Number was successfully created.'
        end
        format.json { render :show, status: :created, location: @raffle }
      else
        format.html { render :new }
        format.json do
          render json: number.errors,
                 status: :unprocessable_entity
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

  private

  def number_params
    number_param = params.require(:number).permit(:user, :number_in_raffle)
    number_param[:user] = User.find number_param[:user].to_i
    number_param
  end
end
