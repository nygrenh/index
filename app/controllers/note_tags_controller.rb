class NoteTagsController < ApplicationController
  before_action :set_note_tag, only: [:show, :edit, :update, :destroy]

  # GET /note_tags
  # GET /note_tags.json
  def index
    @note_tags = NoteTag.all
  end

  # GET /note_tags/1
  # GET /note_tags/1.json
  def show
  end

  # GET /note_tags/new
  def new
    @note_tag = NoteTag.new
  end

  # GET /note_tags/1/edit
  def edit
  end

  # POST /note_tags
  # POST /note_tags.json
  def create
    @note_tag = NoteTag.new(note_tag_params)

    respond_to do |format|
      if @note_tag.save
        format.html { redirect_to @note_tag, notice: 'Note tag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @note_tag }
      else
        format.html { render action: 'new' }
        format.json { render json: @note_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /note_tags/1
  # PATCH/PUT /note_tags/1.json
  def update
    respond_to do |format|
      if @note_tag.update(note_tag_params)
        format.html { redirect_to @note_tag, notice: 'Note tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @note_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /note_tags/1
  # DELETE /note_tags/1.json
  def destroy
    @note_tag.destroy
    respond_to do |format|
      format.html { redirect_to note_tags_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note_tag
      @note_tag = NoteTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_tag_params
      params[:note_tag]
    end
end
