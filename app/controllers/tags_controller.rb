class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy, :change_color]
  before_action :ensure_that_signed_in

  # GET /tags
  # GET /tags.json
  def index
    @tags = current_user.tags
            .order(links_count: :desc)
            .page(params[:page])
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @links = @tag.links
             .includes(:tags, :domain, :user)
             .order(created_at: :desc)
             .where(user_id: current_user.id)
             .page(params[:page])
             .load
  end

  # GET /tags/1/edit
  def edit
    @colors = Color.colors
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    update_and_respond(@tag, tag_params)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = current_user.tags.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit(:name, :description, :color)
  end
end
