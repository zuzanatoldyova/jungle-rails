class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to @product, notice: 'Review created!'
    else
      redirect_to @product, notice: 'Review not created'
    end
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to [:new, :session]
    end
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
