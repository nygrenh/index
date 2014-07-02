class SessionsController < ApplicationController
  def new
  end

  def create
    name = params[:name]
    user = User.find_by('lower(name) = ?', name.downcase)
    if user.nil? || !user.authenticate(params[:password])
      redirect_to :back, notice: 'Username and password do not match.'
    else
      session[:user_id] = user.id
      redirect_to session[:return_to] || links_path, notice: "You've logged in."
      session[:return_to] = nil
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: "You've logged out."
  end
end
