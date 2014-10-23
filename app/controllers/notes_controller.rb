class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in

  # GET /notes
  # GET /notes.json
  def index
    @notes = current_user.notes
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.user = current_user
    create_and_respond(@note)
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    update_and_respond(@note, note_params)
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    destroy_and_respond(@note)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = current_user.notes.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def note_params
    params.require(:note).permit(:name, :text, :user_id)
  end
end
