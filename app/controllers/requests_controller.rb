class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :set_user, except: [:awaiting, :approve]

  # GET /requests
  # GET /requests.json
  def index
    @requests = @user.requests
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to user_requests_path, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to user_requests_path(@user), notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def awaiting
    @requests = Request.where(approved: false)
  end

  def approve
    @request = Request.find params[:id]
    @request.approved = true
    @request.user.amount += @request.amount
    if @request.save && @request.user.save
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      request_param = params.require(:request).permit(:amount)
      request_param[:user] = User.find params[:user_id]
      request_param[:approved] = false
      request_param
    end
end
