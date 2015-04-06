class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return nil unless session[:user_id]
    User.find_by id: session[:user_id]
  end

  def ensure_that_signed_in
    return unless current_user.nil?
    session[:return_to] = request.url
    redirect_to new_session_path, notice: 'Please log in.'
  end

  def create_and_respond(object)
    respond_to do |format|
      if object.save
        format.html { redirect_to object, notice: response_notice(object, 'created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update_and_respond(object, params)
    respond_to do |format|
      if object.update(params)
        format.html { redirect_to object, notice: response_notice(object, 'updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy_and_respond(object)
    object.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_url(object), notice: response_notice(object, 'destroyed') }
      format.json { head :no_content }
    end
  end

  def response_notice(object, action)
    "#{object.class} was successfully #{action}."
  end
end
