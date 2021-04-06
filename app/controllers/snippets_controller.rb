class SnippetsController < ApplicationController
  before_action :require_auth
  before_action :validate_emoji, only: :create

  def create
    @emoji = create_params[:emoji]
    snippet_content = render_to_string partial: 'snippets/inject'
    begin
      res = RestClient.post "https://connect.squareup.com/v2/sites/#{params[:site_id]}/snippet", JSON.generate({"snippet": {"content": snippet_content}}), {'Content-Type': 'application/json', 'Authorization': "Bearer #{session[:auth]['credentials']['token']}"}
    rescue RestClient::ExceptionWithResponse => e
    end
    redirect_to site_path(params[:site_id])
  end

  def destroy
    res = RestClient.delete "https://connect.squareup.com/v2/sites/#{params[:site_id]}/snippet", {'Content-Type': 'application/json', 'Authorization': "Bearer #{session[:auth]['credentials']['token']}"}
    redirect_to site_path(params[:site_id])
  end

  private

  def validate_emoji
    render json: {error: "Invalid Emoji"}, status: 400 unless ["👍","😀", "🤔", "❤️", "💯", "🚀"].include?(create_params[:emoji])
  end

  def create_params
    params.require(:snippet).permit(:emoji)
  end
end

