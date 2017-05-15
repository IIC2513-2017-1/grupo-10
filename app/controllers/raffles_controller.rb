# frozen_string_literal: true

class RafflesController < ApplicationController
  before_action :set_raffle, only: %i[show edit update destroy]
  before_action :set_users, only: %i[new edit create]
  # GET /raffles
  # GET /raffles.json
  def index
    @raffles = Raffle.all
  end

  # GET /raffles/1
  # GET /raffles/1.json
  def show; end

  # GET /raffles/new
  def new
    @raffle = Raffle.new
  end

  # GET /raffles/1/edit
  def edit; end

  # POST /raffles
  # POST /raffles.json
  # rubocop:disable Metrics/MethodLength
  def create
    @raffle = Raffle.new(raffle_params)
    respond_to do |format|
      if @raffle.save
        format.html do
          redirect_to @raffle,
                      notice: 'Raffle was successfully created.'
        end
        format.json { render :show, status: :created, location: @raffle }
      else
        format.html { render :new }
        format.json do
          render json: @raffle.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /raffles/1
  # PATCH/PUT /raffles/1.json
  def update
    respond_to do |format|
      if @raffle.update(raffle_params)
        format.html do
          redirect_to @raffle, notice: 'Raffle was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @raffle }
      else
        format.html { render :edit }
        format.json do
          render json: @raffle.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /raffles/1
  # DELETE /raffles/1.json
  def destroy
    @raffle.destroy
    respond_to do |format|
      format.html do
        redirect_to raffles_url,
                    notice: 'Raffle was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_raffle
    @raffle = Raffle.find(params[:id])
  end

  def set_users
    @users = User.all
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  # rubocop:disable Metrics/AbcSize
  def raffle_params
    raffle_param = params.require(:raffle).permit(
      :description, :organizator, :title,
      :price, :number_amount, :private
    )
    organizator = User.find raffle_param[:organizator].to_i
    raffle_param[:organizator] = organizator
    raffle_param[:start_date] = DateTime.parse(
      "#{params[:start_date]} #{params[:start_time]}"
    )
    raffle_param[:end_date] = DateTime.parse(
      "#{params[:end_date]} #{params[:end_time]}"
    )
    raffle_param
  end
end
