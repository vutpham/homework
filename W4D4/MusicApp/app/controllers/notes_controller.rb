class NotesController < ApplicationController

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id

    if @note.save
    else
      flash[:errors] = @note.errors.full_messages
    end
    redirect_to track_url(@note.track_id)
  end

  def destroy
  end

  def note_params
    params.require(:note).permit(:body, :track_id)
  end
end
