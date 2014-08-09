class SearchController < ApplicationController
  before_action :ensure_that_signed_in

  def index
    @results = PgSearch.multisearch(params[:q])
  end
end
