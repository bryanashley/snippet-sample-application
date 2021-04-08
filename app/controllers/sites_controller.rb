class SitesController < ApplicationController
  before_action :require_auth

  def index
    @sites = square_client.list_sites
  end

  def show
    sites = square_client.list_sites
    @site = sites.select {|site| site.id === params[:id]}.first
    @snippet = square_client.get_snippet(@site.id)
  end

end