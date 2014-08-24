class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy, :change_color]
  before_action :ensure_that_signed_in

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag
    .where(user_id: current_user.id)
    .sort_by { |t| -t.link_count }
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
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    create_response(@tag.update(tag_params), @tag, 'updated', @tag, 'edit')
  end

  # PATCH /tags/1/change_color
  def change_color
    @tag.update(tag_type: params[:color]) if allowed_color
    redirect_to @tag
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id])
    check_for_permission(@tag)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit(:name, :description)
  end

  def allowed_color
    allowed_colors = %w(default primary success info warning danger).to_set
    allowed_colors.include?(params[:color])
  end
end
