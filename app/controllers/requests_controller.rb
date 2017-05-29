# frozen_string_literal: true

class RequestsController < ApplicationController
  # rubocop:disable Metrics/MethodLength
  before_action :set_request, only: %i[show edit update destroy]
  before_action :set_user, except: %i[awaiting approve]

  # GET /requests
  # GET /requests.json
  def index
    redirect_to @user unless current_user == @user
    @requests = @user.requests
    @request = Request.new
  end

  # GET /requests/1
  # GET /requests/1.json
  def show; end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit; end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html do
          redirect_to user_requests_path,
                      notice: 'Request was successfully created.'
        end
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json do
          render json: @request.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html do
          redirect_to @request,
                      notice: 'Request was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json do
          render json: @request.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html do
        redirect_to user_requests_path(@user),
                    notice: 'Request was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  def awaiting
    redirect_to current_user unless current_user&.admin?
    @requests = Request.where(approved: false)
  end

  def approve
    @request = Request.find params[:id]
    @request.approved = true
    @request.user.amount += @request.amount
    if @request.save && @request.user.save
      UserMailer.request_approved(@request).deliver_later
      redirect_to requests_path
    else
      redirect_to requests_path, notice: 'Couldn\'t approve request.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  def set_user
    @user = User.find params[:user_id]
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def request_params
    request_param = params.require(:request).permit(:amount)
    request_param[:user] = User.find params[:user_id]
    request_param[:approved] = false
    request_param
  end
end
