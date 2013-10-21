class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /userss.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # POST /users.json
  def create
    @user = User.new(user_params)

    begin
      api_key = SecureRandom.hex
    end while User.where(api_key: api_key).count > 0

    @user.api_key = api_key

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /users/key/:key
  def key
    respond_to do |format|
      if User.where(api_key: params[:key]).count > 0
        format.json { render nothing: true, status: :ok }
      else
        format.json { render nothing: true, status: :not_found }
      end
    end
  end

  def login
    if !params[:api_key].blank?
      if User.where(api_key: params[:api_key]).count > 0
        cookies[:api_key] = params[:api_key]
        flash[:notice] = "Successfully logged in"
        redirect_to request.referrer || problems_path
      else
        flash.now[:error] = "Invalid API key"
      end
    end
  end

  def login_cli
    self.login
  end

  def logout
    cookies.delete(:api_key)
    redirect_to request.referrer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :api_key)
    end
end
