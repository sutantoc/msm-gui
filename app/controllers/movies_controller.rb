class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    d = Movie.new
    d.title = params.fetch("title_field")
    d.year = params.fetch("year_field")
    d.duration = params.fetch("duration_field")
    d.description = params.fetch("description_field")
    d.image = params.fetch("image_field")
    d.director_id = params.fetch("director_field")
    d.save

    redirect_to("/movies")
  end
end
