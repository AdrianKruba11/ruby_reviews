class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]

  # GET /movies
  def index
    @movies = Movie.all.order(created_at: :desc)
  end

  # GET /movies/:id
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "Movie was successfully created."  # Przekierowanie na stronę główną (index)
    else
      render :new, status: :unprocessable_entity
    end
  end


  # GET /movies/:id/edit
  def edit
  end

  # PATCH/PUT /movies/:id
  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /movies/:id
  def destroy
    @movie.destroy
    redirect_to movies_url, notice: "Movie was successfully deleted."
  end

  def create_review
    @movie = Movie.find(params[:movie_id])  # Wyszukaj film na podstawie ID
    @review = @movie.reviews.build(review_params)  # Stwórz nową recenzję powiązaną z filmem
    if @review.save
      redirect_to @movie, notice: "Review was successfully added."  # Przekierowanie po zapisaniu
    else
      render :show, status: :unprocessable_entity  # Jeśli coś poszło nie tak, wróć do strony filmu
    end
  end


  private

  # Ustawianie zmiennej @movie na podstawie ID
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Parametry dozwolone w formularzu
  def movie_params
    params.require(:movie).permit(:title, :author, :release_year, :category, :rating, :watched)
  end

  def review_params
    params.require(:review).permit(:content, :rating)  # Parametry recenzji
  end

  def set_movie
    @movie = Movie.find(params[:id])  # Znajdź film na podstawie jego ID
  end


end
