class ApplicationController < ActionController::Base

  def require_auth
    redirect_to welcome_path unless session[:auth]
  end

  def square_client
    squareApiClient = Square::SquareApiClient.new
    squareApiClient.access_token = session[:auth]['credentials']['token']

    return squareApiClient
  end

end
