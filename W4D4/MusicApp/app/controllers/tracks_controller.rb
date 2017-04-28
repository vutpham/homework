class TracksController < ApplicationController
  before_action :ensure_user_logged_in

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    @track.album_id = params[:track][:album_id]
    if @track.save
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to new_band_track_url(params[:album_id])
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def show
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to edit_track_url(@track)
    end

  end

  def destroy
    @track = Track.find(params[:id])
    band = @track.band.id
    @track.destroy
    redirect_to band_url(band)
  end

  private

  def track_params
    params.require(:track).permit(:title, :release, :lyrics)
  end
end
