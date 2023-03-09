class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]
  def new
    @bookmark = Bookmark.new
    @bookmark.list = @list
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.movie = Movie.find(params[:bookmark][:movie_id])
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie, :comment)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
