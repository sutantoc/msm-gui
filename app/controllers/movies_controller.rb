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

  def delete
    m_id = params.fetch("movie_id")
    matching_results = Movie.where({ :id => m_id})
    the_movie = matching_results.at(0)
    the_movie.destroy
    redirect_to("/movies")
  end

  def modify
    movie_id = params.fetch("movie_id")
    matching_movies = Movie.where({ :id => movie_id})
    the_movie = matching_movies.at(0)

    the_movie.title = params.fetch("title_field")
    the_movie.year = params.fetch("year_field")
    the_movie.duration = params.fetch("duration_field")
    the_movie.description = params.fetch("description_field")
    the_movie.image = params.fetch("image_field")
    the_movie.director_id = params.fetch("director_field")
    the_movie.save
    redirect_to("/movies/#{the_movie.id}")
  end

end
