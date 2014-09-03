class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in
  before_action :set_tagstring, only: [:update]

  # GET /links
  # GET /links.json
  def index
    @links = Link
             .includes(:tags, :domain, :user)
             .order(created_at: :desc)
             .where(user_id: current_user.id)
             .page(params[:page])
             .load
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
    set_tag_s
    @link.url = params[:url]
    @link.title = params[:title]
  end

  # GET /links/1/edit
  def edit
    set_tag_s
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    @link.user = current_user
    set_tagstring
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
    domain = @link.domain
    result = @link.destroy
    if result
      domain.link_count -= 1 if domain && !domain.destroyed?
    end
    create_response(result, @link, 'destroyed', links_url, links_url)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
    check_for_permission(@link)
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def link_params
    params.require(:link).permit(:title, :url, :description)
  end

  def set_tag_s
    @tag_s = @link.tags.map(&:name).to_sentence(last_word_connector: ', ', two_words_connector: ', ')
  end

  def set_tagstring
    @link.tagstring = params[:link][:tags]
  end
end
