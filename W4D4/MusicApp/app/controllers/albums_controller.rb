class AlbumsController < ApplicationController
  before_action :ensure_user_logged_in

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    @album.band_id = params[:album][:band_id]
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_band_album_url(params[:band_id])
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to edit_album_url(@album)
    end

  end

  def destroy
    @album = Album.find(params[:id])
    band = @album.band.id
    @album.destroy
    redirect_to band_url(band)
  end

  private

  def album_params
    params.require(:album).permit(:title, :style)
  end
end
