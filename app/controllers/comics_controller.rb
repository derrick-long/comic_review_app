class ComicsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :comic_permissions, only: [:update, :destroy]
  def index
    @comics = Comic.all
  end
  #
  def new
    @comic = Comic.new
  end

  def create
    @comic = current_user.comics.build(comic_params)
    if @comic.save
      flash[:notice] = "New comic added!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @comic = Comic.find(params[:id]) #like this to be comic_id
    @reviews = @comic.reviews.order('created_at DESC').all
    @review = Review.new
    @vote = Vote.new
  end

  def edit
    @comic = Comic.find(params[:id])
  end

  def update
    @comic = Comic.find(params[:id])
    if @comic.update_attributes(comic_params)
      flash[:notice] = "Comic Updated!"
      redirect_to @comic
    else
      render 'edit'
    end
  end

  def destroy
    Comic.find(params[:id]).destroy
    flash[:notice] = "Comic Deleted!"
    redirect_to comics_url
  end


  private

  def comic_permissions
    @comic = Comic.find(params[:id])
    unless current_user.id == @comic.user_id || current_user.admin?
      redirect_to(root_url)
    end
  end


  def comic_params
    params.require(:comic).permit(:user_id, :author, :artist, :description, :genre_id, :title)
  end



end
