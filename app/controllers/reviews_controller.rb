class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  #make work off ajax, pretty duddy atm
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

  #need to test this after deleting a review, also need to clean up ROUTES

  def edit
    #missing required key comic path
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
    #we want this to redirect back to our show page
    #also need to update my paths
    #also need to take a look at my routes
    #works but not well
  end


  private

  def review_params
    params.require(:review).permit(:user_id, :comic_id, :content, :rating)
  end
end
