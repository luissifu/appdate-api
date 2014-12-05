class NotesController < ApplicationController
  before_action :set_note, only: :edit

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to home_path
    else
      render :new
    end

    # respond_to do |format|
    #   if @note.save
    #     format.html { redirect_to @note, notice: 'Note was successfully created.' }
    #     format.json { render :show, status: :created, location: @note }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @note.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    if @note.update(note_params)
      redirect_to home_path
    else
      render :edit
    end

    # respond_to do |format|
    #   if @note.update(note_params)
    #     format.html { redirect_to @note, notice: 'Note was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @note }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @note.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @note.destroy
    
    redirect_to home_path

    # respond_to do |format|
    #   format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params[:note].permit(:user_id, :name, :desc)
    end
end
