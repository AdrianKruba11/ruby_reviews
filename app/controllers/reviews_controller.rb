class ReviewsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])  # Znajdź film na podstawie ID
    @review = @movie.reviews.build(review_params)  # Stwórz nową recenzję powiązaną z filmem
    if @review.save
      redirect_to @movie, notice: "Review was successfully added."
    else
      render 'movies/show', status: :unprocessable_entity  # Jeśli coś poszło nie tak, wróć do strony filmu
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)  # Parametry recenzji
  end
end
