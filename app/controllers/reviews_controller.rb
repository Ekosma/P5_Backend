class ReviewsController < ApplicationController
  # GET /reviews
  def index
    @reviews = Review.all
    render json: @reviews
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)
    if @review.save
      review = Review.where("lesson_id = ?", @review.lesson_id)
      render json: reviews, status: :created, location: @reviews
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @user_id = @review.user_id
    @review.destroy
    reviews = Review.where("lesson_id = ?", @lesson_id)
    render json: reviews, location: @reviews
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.permit(:recommended, :comment, :lesson_id)
    end
end
end
