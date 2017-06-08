class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]
  #make work off ajax, pretty duddy atm
  def create
    #repetitive, need to clean this up
    @review = Review.new(review_params)
    @comic = Comic.find(params[:comic_id])
    # @reviews = @comic.reviews.order('created_at DESC').all
    if @review.save
      flash[:notice] = "Review Added!"
      redirect_to @comic
       # controllers action, since we jump into this controller here
    else
      render 'comics/show'
    end
  end


  private

  def review_params
    params.require(:review).permit(:user_id, :comic_id, :content, :rating)
  end
end
