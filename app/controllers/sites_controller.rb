class SitesController < ApplicationController
  before_action :require_auth

  def index
    res = RestClient.get 'https://connect.squareup.com/v2/sites', {'Content-Type': 'application/json', 'Authorization': "Bearer #{session[:auth]['credentials']['token']}"}
    @sites = JSON.parse(res)["sites"]
  end

  def show
    sitesRes = RestClient.get 'https://connect.squareup.com/v2/sites', {'Content-Type': 'application/json', 'Authorization': "Bearer #{session[:auth]['credentials']['token']}"}
    @site = JSON.parse(sitesRes)["sites"].select {|site| site['id'] === params[:id]}.first
    begin
      snippetRes = RestClient.get "https://connect.squareup.com/v2/sites/#{params[:id]}/snippet", {'Content-Type': 'application/json', 'Authorization': "Bearer #{session[:auth]['credentials']['token']}"}
      @snippet = JSON.parse(snippetRes)["snippet"]
    rescue RestClient::ExceptionWithResponse => e
      
    end
  end

end