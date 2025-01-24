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

  private

  # Ustawianie zmiennej @movie na podstawie ID
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Parametry dozwolone w formularzu
  def movie_params
    params.require(:movie).permit(:title, :author, :release_year, :category, :rating, :watched)
  end


end
