class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in
  before_action :set_tagstring, only: [:update]

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
    @link = current_user.links.new link_params
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
    destroy_and_respond(@link)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = current_user.links.find(params[:id])
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
