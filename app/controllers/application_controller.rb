class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
  	return nil if session[:user_id].nil?
  	User.find(session[:user_id])
  end

  def ensure_that_signed_in
    if current_user.nil?
      session[:return_to] = request.url
      redirect_to new_session_path, notice:'Please log in.'
    end
  end

  def create_response(result, object, message, success_destination, fail_destination)
    respond_to do |format|
      if result
        format.html { redirect_to success_destination, notice: "#{object.class} was successfully #{message}." }
        format.json { head :no_content }
      else
        format.html { render action: fail_destination }
        format.json { render json: object.errors, status: :unprocessable_entity }
      end
    end
  end
end
