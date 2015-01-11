class SearchController < ApplicationController
  before_action :ensure_that_signed_in

  def index
    @results = current_user.links
               .search(params[:q])
               .includes(:tags, :domain, :user)
               .page(params[:page])
               .load
  end
end
