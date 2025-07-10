class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      @reviews = @restaurant.reviews
      render "restaurants/show", status: :unprocessable_entity
      # redirect_to restaurant_path(@restaurant)
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
    @review = Review.new # 👈 add this
  end

private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
