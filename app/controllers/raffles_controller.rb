# frozen_string_literal: true

class RafflesController < ApplicationController
  include TwitterAPI
  before_action :set_raffle, only: %i[show edit update destroy tweet]
  before_action :set_users, only: %i[new edit create]

  # GET /raffles
  # GET /raffles.json
  def index
    @raffles = Raffle.where(private: false)
  end

  def set_token
    response = request.env['omniauth.auth']
    session[:token] = response[:credentials][:token]
    session[:secret] = response[:credentials][:secret]
    redirect_to user_path(current_user)
  end

  def tweet
    case tweet_raffle(@raffle).code
    when '403'
      redirect_to @raffle, alert: 'Raffle has already been tweeted.'
    when '200'
      redirect_to @raffle, notice: 'Your raffle was successfully tweeted.'
    end
  end

  # GET /raffles/1
  # GET /raffles/1.json
  def show
    @total_money = @raffle.transactions.map(&:amount).reduce(:+)
    @raffle = Raffle.find(params[:id])
    respond_to do |format|
      format.html
      format.json do
        @raffle = Raffle.select_data(Raffle.where(id: params[:id])).first
        render json: @raffle
      end
    end
  end

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

  # GET /raffles/1/winners
  def show_winners
    @raffle = Raffle.find(params[:id])
    @winners = Winner.where(raffle_id: @raffle.id).select(:user_id, :prize_id)
    @winners = Winner.format_json(@winners)
    render(json: @winners)
  end

  # POST /raffles/1/winners
  def choose_winners
    @raffle = Raffle.find(params[:id])
    puts 'A'
    if current_user && current_user == @raffle.organizator
      @winners = Winner.where(raffle_id: @raffle.id)
      assign_prizes if @winners.empty?
      render(json: @winners)
      return
    end
    puts 'B'
    render(json: { mensaje: 'Unauthorized' }.as_json,
           status: 401)
  end

  private

  def assign_prizes
    must_assign = [@raffle.prizes.size, @raffle.numbers.size].min
    @prizes = @raffle.prizes.shuffle.sample(must_assign)
    @users = @raffle.numbers.shuffle.sample(must_assign).map do |winner_number|
      User.find_by_id(winner_number.user_id)
    end
    @winners = []
    @prizes.zip(@users).each do |prize, user|
      @winners << Winner.create(user_id: user.id, raffle_id: @raffle.id, prize_id: prize.id)
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_raffle
    @raffle = Raffle.find(params[:id])
  end

  def set_users
    @users = User.all
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def raffle_params
    raffle_param = params.require(:raffle).permit(
      :description, :title,
      :price, :number_amount, :private
    )
    raffle_param[:organizator] = current_user
    raffle_param[:start_date] = DateTime.parse(
      "#{params[:start_date]} #{params[:start_time]}"
    )
    raffle_param[:end_date] = DateTime.parse(
      "#{params[:end_date]} #{params[:end_time]}"
    )
    raffle_param
  end
end
