class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def authenticate_api
    user = User.find_by(email: request.headers['HTTP_X_USER_EMAIL'])
    acces = user ? request.headers['HTTP_X_API_TOKEN'] == user.api_token : false

    unless acces
      render json: { errors: "Acceso denegado" }, status: 401
    end
  end

end
