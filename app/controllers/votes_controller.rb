class VotesController < ApplicationController
  before_action :authenticate_user!
#need to update to AJAX


  def create

    @review = Review.find(vote_params[:review_id])
    @comic = @review.comic
    @vote = Vote.find_by(user_id: current_user.id, review_id: @review.id)
    user_input = vote_params[:value].to_i

    if @vote
      if  @vote.value == 0
          @vote.value = user_input
          @vote.save
          flash[:notice] = "Vote updated!"
          redirect_to @comic
      elsif  @vote.value == user_input
          flash[:notice] = "You can only vote once!"
          redirect_to @comic
      else
          @vote.value = 0
          @vote.save
          flash[:notice] = "Vote  updated!"
          redirect_to @comic
      end
    else
      @vote = Vote.create(vote_params)
      flash[:notice] = "Vote added!"
      redirect_to @comic
    end
  end

  private


  def vote_params
    params.require(:vote).permit(:user_id, :review_id, :value)
  end

end
