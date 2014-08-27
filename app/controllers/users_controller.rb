class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in, except: [:new, :create]
  before_action :check_user, except: [:new, :index, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    create_and_respond(@user)
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    result = @user.update(user_params)
    create_response(result, @user, 'updated', @user, 'edit')
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def check_user
    redirect_to users_path, alert: "You don't have permission to do that." unless current_user.id == @user.id
  end
end
