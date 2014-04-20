class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in

  # GET /links
  # GET /links.json
  def index
    @links = Link.where user_id:current_user.id
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
    set_tag_s
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
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
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
      domain = Domain.find_by domain:domain_s
      if(domain.nil?)
        domain = Domain.create domain:domain_s
      end
      @link.domain = domain
      @link.save
    end

    def update_tags(tagstring)
      @link.tags = []
      if tagstring.nil?
        return
      end
      tags = tagstring.split(', ')
      tags.each do |t|
        tag = tag(t)
        @link.tags << tag unless @link.tags.exists? tag
      end
    end

    def tag(name)
      tag = Tag.where("lower(name) = ?", name.downcase).first
      if tag.nil?
        tag = Tag.create name:name, tag_type:'default'
      end
      tag
    end

    def set_tag_s
      @tag_s = @link.tags.map(&:name).to_sentence(last_word_connector: ", ", two_words_connector: ", ")
    end
end
