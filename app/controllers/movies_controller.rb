class MoviesController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]
  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(set_params)
    if @movie.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @movie.update(set_params)
      redirect_to movie_url(@movie[:id])
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to root_url
  end

  private

  def set_params
    params.require(:movie).permit(:title, :text, :rating, :category)
  end

  def find
    @movie = Movie.find(params[:id])
  end
end