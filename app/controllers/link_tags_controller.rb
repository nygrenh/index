class LinkTagsController < ApplicationController
  before_action :set_link_tag, only: [:show, :edit, :update, :destroy]

  # GET /link_tags
  # GET /link_tags.json
  def index
    @link_tags = LinkTag.all
  end

  # GET /link_tags/1
  # GET /link_tags/1.json
  def show
  end

  # GET /link_tags/new
  def new
    @link_tag = LinkTag.new
  end

  # GET /link_tags/1/edit
  def edit
  end

  # POST /link_tags
  # POST /link_tags.json
  def create
    @link_tag = LinkTag.new(link_tag_params)

    respond_to do |format|
      if @link_tag.save
        format.html { redirect_to @link_tag, notice: 'Link tag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link_tag }
      else
        format.html { render action: 'new' }
        format.json { render json: @link_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /link_tags/1
  # PATCH/PUT /link_tags/1.json
  def update
    respond_to do |format|
      if @link_tag.update(link_tag_params)
        format.html { redirect_to @link_tag, notice: 'Link tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @link_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /link_tags/1
  # DELETE /link_tags/1.json
  def destroy
    @link_tag.destroy
    respond_to do |format|
      format.html { redirect_to link_tags_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link_tag
      @link_tag = LinkTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_tag_params
      params.require(:link_tag).permit(:link_id, :tag_id)
    end
end
