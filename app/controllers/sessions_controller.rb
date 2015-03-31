class SessionsController < ApplicationController
  before_action :set_user, only: :create

  def new
  end

  def create
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to session[:return_to] || links_path, notice: "You've logged in."
      session[:return_to] = nil
    else
      redirect_to :back, alert: 'Username and password do not match.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: "You've logged out."
  end

  private

  def set_user
    name = params[:name]
    @user = User.find_by('lower(name) = ?', name.downcase)
  end
end
