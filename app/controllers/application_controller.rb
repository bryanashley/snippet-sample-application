class ApplicationController < ActionController::Base

  def require_auth
    redirect_to welcome_path unless session[:auth]
  end

end
