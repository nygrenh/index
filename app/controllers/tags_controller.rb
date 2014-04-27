class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.where(user_id:current_user.id).sort_by{|t| -t.links.count}
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /tags/1/edit
  def edit
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    create_response(@tag.update(tag_params), @tag, 'updated', @tag, 'edit')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name, :description, :tag_type)
    end
end
