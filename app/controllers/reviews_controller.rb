class ReviewsController < ApplicationController
  before_action :require_user 
  before_action :set_params

  def create
    @video = Video.find(params[:video_id])
    review = @video.reviews.build(set_params.merge!(user: current_user))
    if review.save
      redirect_to @video
    else
      @reviews = @video.reviews.reload  
      render 'videos/show'
    end
  end

  private
  def set_params
    params.require(:review).permit(:rating, :description)
  end
end