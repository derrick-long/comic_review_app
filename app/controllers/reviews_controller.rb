class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :review_permissions, only: [:update, :destroy]

  def create
    @review = Review.new(review_params)
    @comic = Comic.find(params[:comic_id])
    if @review.save
      flash[:notice] = "Review Added!"
      redirect_to @comic
    else
      render 'comics/show'
    end
  end

  def show
  end


  def edit
    @comic = Comic.find(params[:comic_id])
    @review = Review.find(params[:id])
  end

  def update
    @comic = Comic.find(params[:comic_id])
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      flash[:notice]= "Review updated!"
      redirect_to @comic
    else
      render 'edit'
    end
  end

  def destroy
    @comic = Comic.find(params[:comic_id])
    Review.find(params[:id]).destroy
    flash[:notice] = "Review Deleted!"
    redirect_to @comic
  end


  private

  def review_params
    params.require(:review).permit(:user_id, :comic_id, :content, :rating)
  end

  def review_permissions
    @review = Review.find(params[:id])
    unless current_user.id == @review.user_id || current_user.admin?
      redirect_to(root_url)
    end
  end

  #so basically I need a before method that will make sure my current user is an admin
  # OR that the current user is the owner of the object
  # SO authenticate methods can stay but I need to mess with the "current_user"

end
