class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in

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
    update_tags(params[:link][:tags])
    @link.user = current_user
    respond_to do |format|
      if @link.save
        associate_with_domain
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    update_tags(params[:link][:tags])
    create_response(@link.update(link_params), @link, 'updated', @link, 'edit')
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    create_response(@link.destroy, @link, 'destroyed', links_url, links_url)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def link_params
    params.require(:link).permit(:title, :url, :description)
  end

  def associate_with_domain
    domain_s = URI.parse(@link.url).host.gsub(/^www\./, '')
    domain = Domain.find_by domain: domain_s, user_id: current_user.id
    if domain.nil?
      domain = Domain.create domain: domain_s, user_id: current_user.id
    end
    @link.domain = domain
    @link.save
    domain.link_count = domain.links.count
    domain.save
  end

  def update_tags(tagstring)
    @link.tags = []
    return if tagstring.nil?
    tags = tagstring.split(', ')
    tags.each do |t|
      tag = tag(t)
      @link.tags << tag unless @link.tags.exists? tag
    end
  end

  def tag(name)
    tag = Tag.where('lower(name) = ?', name.downcase).find_by(user_id: current_user.id)
    if tag.nil?
      tag = Tag.create name: name, tag_type: 'default', user_id: current_user.id
    end
    tag
  end

  def set_tag_s
    @tag_s = @link.tags.map(&:name).to_sentence(last_word_connector: ', ', two_words_connector: ', ')
  end
end
