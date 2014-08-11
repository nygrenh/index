class SearchController < ApplicationController
  before_action :ensure_that_signed_in

  def index
    @results = Link.search(params[:q])
  end
end
