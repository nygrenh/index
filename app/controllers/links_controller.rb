class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in

  # GET /links
  # GET /links.json
  def index
    @links = current_user.links
             .includes(:tags, :domain, :user)
             .order(created_at: :desc)
             .page(params[:page])
             .load
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = Link.new(params.permit(allowed_attributes))
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = current_user.links.new link_params
    create_and_respond(@link)
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    update_and_respond(@link, link_params)
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    destroy_and_respond(@link)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = current_user.links.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def link_params
    params.require(:link).permit(allowed_attributes)
  end

  def allowed_attributes
    [:title, :url, :description, :tagstring]
  end
end
